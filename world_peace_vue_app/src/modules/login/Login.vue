<template>
  <div id="bg">
    <span v-if="isLogin == 1" class="loginStyle">登录</span>
    <nut-navbar v-if="isLogin == 2" title="注册" @on-click-back="isLogin = 1" />

    <nut-navbar
      v-if="isLogin == 3"
      title="忘记密码"
      @on-click-back="isLogin = 1"
    />

    <nut-navbar
      v-if="isLogin == 4 || isLogin == 5"
      :title="isLogin == 4 ? '用户注册协议' : '隐私协议'"
      @on-click-back="isLogin = 1"
    />

    <span class="dealSpan" v-if="isLogin == 4">
      　　1.特别提示<br />　　1.1为了更好地为您提供服务，请您仔细阅读这份协议。本协议是您与本应用就您登录本应用平台进行注册及使用等所涉及的全部行为所订立的权利义务规范。您在注册过程中点击“注册”等按钮、及注册后登录和使用时，均表明您已完全同意并接受本协议，愿意遵守本协议的各项规则、规范的全部内容，若不同意则可停止注册或使用本应用平台。如您是未成年人，您还应要求您的监护人仔细阅读本协议，并取得他/他们的同意。<br />　　1.2为提高用户的使用感受和满意度，用户同意本应用将基于用户的操作行为对用户数据进行调查研究和分析，从而进一步优化服务。<br />　　2.服务内容<br />　　2.1平台内严禁一切非法、涉黄信息，违反社区运营规范者，一律封号处理。<br />　　2.2本应用服务的具体内容由本应用制作者根据实际情况提供。<br />　　2.3除非本注册及服务协议另有其它明示规定，本应用所推出的新产品、新功能、新服务，均受到本注册及注册协议规范。<br />　　2.4本应用仅提供相关的网络服务，除此之外与相关网络服务有关的设备(如个人电脑、手机、及其他与接入互联网或移动网有关的装置)及所需的费用(如为接入互联网而支付的电话费及上网费、为使用移动网而支付的手机费)均应由用户自行负担。<br />　　3.使用规则<br />　　3.1用户帐号注册<br />　　3.1.1使用本应用系统注册的用户，只能使用汉字、英文字母、数字、下划线及它们的组合，禁止使用空格、各种符号和特殊字符，且最多不超过16个字符(8个汉字)注册，否则将不予注册。<br />　　3.1.2使用第三方合作网站登录的用户，只能使用汉字、英文字母、数字、下划线及它们的组合，禁止使用空格、各种符号和特殊字符，且最多不超过14个字符(7个汉字)注册，否则本社区有权只截取前14个字符（7个汉字）予以显示用户帐号（若该用户帐号与应用现有用户帐号重名，系统将随机添加一个字符以示区别），否则将不予注册。<br />　　3.2如发现用户帐号中含有不雅文字或不恰当名称的，本应用保留取消其用户资格的权利。<br />　　3.2.1请勿以党和国家领导人或其他社会名人的真实姓名、字号、艺名、笔名注册；<br />　　3.2.2请勿以国家机构或其他机构的名称注册；<br />　　3.2.3请勿注册不文明、不健康名字，或包含歧视、侮辱、猥亵类词语的帐号；<br />　　3.2.4请勿注册易产生歧义、引起他人误解或其它不符合法律规定的帐号。<br />　　3.3用户帐号的所有权归本应用，用户仅享有使用权。<br />　　3.4用户有义务保证密码和帐号的安全，用户利用该密码和帐号所进行的一切活动引起的任何损失或损害，由用户自行承担全部责任，本应用不承担任何责任。如用户发现帐号遭到未授权的使用或发生其他任何安全问题，应立即修改帐号密码并妥善保管，如有必要，请反馈通知本应用管理人员。因黑客行为或用户的保管疏忽导致帐号非法使用，本应用不承担任何责任。<br />　　3.5用户承诺对其发表或者上传于本应用的所有信息(即属于《中华人民共和国著作权法》规定的作品，包括但不限于文字、图片、音乐、电影、表演和录音录像制品和电脑程序等)均享有完整的知识产权，或者已经得到相关权利人的合法授权；如用户违反本条规定造成本应用被第三人索赔的，用户应全额补偿本应用的一切费用(包括但不限于各种赔偿费、诉讼代理费及为此支出的其它合理费用)；<br />　　3.6当第三方认为用户发表或者上传于本应用的信息侵犯其权利，并根据《信息网络传播权保护条例》或者相关法律规定向本应用发送权利通知书时，用户同意本应用可以自行判断决定删除涉嫌侵权信息，除非用户提交书面证据材料排除侵权的可能性，本应用将不会自动恢复上述删除的信息；<br />　　(1)不得为任何非法目的而使用网络服务系统；<br />　　(2)遵守所有与网络服务有关的网络协议、规定和程序；<br />　　(3)不得利用本应用的服务进行任何可能对互联网的正常运转造成不利影响的行为；<br />　　(4)不得利用本应用服务进行任何不利于本应用的行为。<br />　　3.7如用户在使用网络服务时违反上述任何规定，本应用有权要求用户改正或直接采取一切必要的措施(包括但不限于删除用户上传的内容、暂停或终止用户使用网络服务的权利)以减轻用户不当行为而造成的影响。<br />　　4.责任声明<br />　　4.1任何网站、单位或者个人如认为本应用或者本应用提供的相关内容涉嫌侵犯其合法权益，应及时向本应用提供书面权力通知，并提供身份证明、权属证明及详细侵权情况证明。本应用在收到上述法律文件后，将会尽快切断相关内容以保证相关网站、单位或者个人的合法权益得到保障。<br />　　4.2用户明确同意其使用本应用网络服务所存在的风险及一切后果将完全由用户本人承担，本应用对此不承担任何责任。<br />　　4.3本应用无法保证网络服务一定能满足用户的要求，也不保证网络服务的及时性、安全性、准确性。<br />　　4.4本应用不保证为方便用户而设置的外部链接的准确性和完整性，同时，对于该等外部链接指向的不由本应用实际控制的任何网页上的内容，本应用不承担任何责任。<br />　　5.知识产权<br />　　5.1本应用特有的标识、版面设计、编排方式等版权均属本应用享有，未经本应用许可授权，不得任意复制或转载。<br />　　5.2用户从本应用的服务中获得的信息，未经本应用的许可，不得任意复制或转载。<br />　　5.3本应用的所有内容，包括商品描述、图片等内容所有权归属于本应用的用户，任何人不得转载。<br />　　5.4本应用所有用户上传内容仅代表用户自己的立场和观点，与本应用无关，由作者本人承担一切法律责任。<br />　　5.5上述及其他任何本服务包含的内容的知识产权均受到法律保护，未经本应用、用户或相关权利人书面许可，任何人不得以任何形式进行使用或创造相关衍生作品。<br />　　6.隐私保护<br />　　6.1本应用不对外公开或向第三方提供单个用户的注册资料及用户在使用网络服务时存储在本社区的非公开内容，但下列情况除外：<br />　　(1)事先获得用户的明确授权；<br />　　(2)根据有关的法律法规要求；<br />　　(3)按照相关政府主管部门的要求；<br />　　(4)为维护社会公众的利益。<br />　　6.2本应用可能会与第三方合作向用户提供相关的网络服务，在此情况下，如该第三方同意承担与本社区同等的保护用户隐私的责任，则本社区有权将用户的注册资料等信息提供给该第三方，并无须另行告知用户。<br />　　6.3在不透露单个用户隐私资料的前提下，本应用有权对整个用户数据库进行分析并对用户数据库进行商业上的利用。<br />　　7.协议修改<br />　　7.1本应用有权随时修改本协议的任何条款，一旦本协议的内容发生变动，本应用将会在本应用上公布修改之后的协议内容，若用户不同意上述修改，则可以选择停止使用本应用。本应用也可选择通过其他适当方式（比如系统通知）向用户通知修改内容。<br />　　7.2如果不同意本应用对本协议相关条款所做的修改，用户有权停止使用本应用。如果用户继续使用本应用，则视为用户接受本应用对本协议相关条款所做的修改。<br />　　8.通知送达<br />　　8.1本协议项下本应用对于用户所有的通知均可通过网页公告、电子邮件、系统通知、微博管理帐号主动联系、私信、手机短信或常规的信件传送等方式进行；该等通知于发送之日视为已送达收件人。<br />　　8.2用户对于本应用的通知应当通过本应用对外正式公布的通信地址、电子邮件地址等联系信息进行送达。
    </span>

    <span class="dealSpan" v-if="isLogin == 5">
      本网站严格遵守法律法规，遵循以下隐私保护原则，为您提供更加安全、可靠的服务：<br />1、安全可靠：我们竭尽全力通过合理有效的信息安全技术及管理流程，防止您的信息泄露、损毁、丢失。<br />2、自主选择：我们为您提供便利的信息管理选项，以便您做出合适的选择，管理您的个人信息
      。<br />3、保护通信秘密：我们严格遵照法律法规，保护您的通信秘密，为您提供安全的通信服务。<br />4、合理必要：为了向您和其他用户提供更好的服务，我们仅收集必要的信息。<br />5、清晰透明：我们努力使用简明易懂的表述，向您介绍隐私政策，以便您清晰地了解我们的信息处理方式。<br />6、将隐私保护融入产品设计：我们在产品和服务研发、运营的各个环节，融入隐私保护的理念。<br />本《隐私政策》主要向您说明：<br />希望您仔细阅读《隐私政策》（以下简称“本政策”），详细了解我们对信息的收集、使用方式，以便您更好地了解我们的服务并作出适当的选择。若您使用本网站提供的服务，即表示您认同我们在本政策中所述内容。除另有约定外，本政策所用术语与《服务协议》中的术语具有相同的涵义。如您有问题，请联系我们。我们收集的信息我们根据合法、正当、必要的原则，仅收集实现产品功能所必要的信息
      。您在使用我们服务时主动提供的信息<br />您在注册帐户时填写的信息例如，您在注册帐户时所填写的昵称、手机号码。<br />您在使用服务时上传的信息例如，您在使用时，上传的头像、分享的照片。<br />您通过我们的客服或参加我们举办的活动时所提交的信息例如，您参与我们线上活动时填写的调查问卷中可能包含您的姓名、电话、家庭地址等信息。<br />我们的部分服务可能需要您提供特定的个人敏感信息来实现特定功能。若您选择不提供该类信息，则可能无法正常使用服务中的特定功能，但不影响您使用服务中的其他功能。若您主动提供您的个人敏感信息
      即表示您同意我们按本政策所述目的和方式来处理您的个人敏感信息。<br />我们在您使用服务时获取的信息<br />日志信息。当您使用我们的服务时，我们可能会自动收集相关信息并存储为服务日志信息。<br />1)设备信息例如，
      设备型号、操作系统版本、 唯一设备标识符 、电池、信号强度等信息。<br />2)软件信息例如，软件的版本号、浏览器类型。为确保操作环境的安全或提供服务所需，我们会收集有关您使用的移动应用和其他软件的信息。<br />3)
      IP地址<br />4)服务日志信息例如，您在使用我们服务时搜索、查看的信息、服务故障信息、引荐网址等信息。<br />5)通讯日志信息例如，您在使用我们服务时曾经通讯的账户、通讯时间和时长。<br />位置信息。当您使用与位置有关的服务时，我们可能会记录您设备所在的位置信息，以便为您提供相关服务。在您使用服务时，我们可能会通过
      IP地址 、 GPS 、WLAN（如 WiFi
      )或基站等途径获取您的地理位置信息;您或其他用户在使用服务时提供的信息中可能包含您所在地理位置信息，例如您提供的帐号信息中可能包含的您所在地区信息，您或其他人共享的照片包含的地理标记信息。<br />其他相关信息。为了帮助您更好地使用我们的产品或服务，我们会收集相关信息。例如，我们收集的好友列表、群列表信息、声纹特征值信息。为确保您使用我们服务时能与您认识的人进行联系，如您选择开启导入通讯录功能，我们可能对您联系人的姓名和电话号码进行加密，并仅收集加密后的信息。<br />其他用户分享的信息中含有您的信息例如，其他用户发布的照片或分享的视频中可能包含您的信息。从第三方合作伙伴获取的信息我们可能会获得您在使用第三方合作伙伴服务时所产生或分享的信息。例如，您使用微信或QQ帐户登录第三方合作伙伴服务时，我们会获得您登录第三方合作伙伴服务的名称、登录时间，方便您进行授权管理。请您仔细阅读第三方合作伙伴服务的用户协议或隐私政策。我们如何使用收集的信息我们严格遵守法律法规的规定及与用户的约定，将收集的信息用于以下用途。若我们超出以下用途使用您的信息，我们将再次向您进行说明，并征得您的同意。向您提供服务满足您的个性化需求例如，语言设定、位置设定、个性化的帮助服务。安全保障例如，我们会将您的信息用于身份验证、安全防范、反诈骗监测、存档备份、客户的安全服务等用途。例如，您下载或安装的安全软件会对恶意程序或病毒进行检测，或为您识别诈骗信息。向您推荐您可能感兴趣的广告、资讯等评估、改善我们的广告投放和其他促销及推广活动的效果管理软件例如，进行软件认证、软件升级等。邀请您参与有关我们服务的调查为了让您有更好的体验、改善我们的服务或经您同意的其他用途，在符合相关法律法规的前提下，我们可能将通过某些服务所收集的信息用于我们的其他服务。例如，将您在使用我们某项服务时的信息，用于另一项服务中向您展示个性化的内容或广告、用于用户研究分析与统计等服务。为了确保服务的安全，帮助我们更好地了解我们应用程序的运行情况，我们可能记录相关信息，例如，您使用应用程序的频率、故障信息、总体使用情况、性能数据以及应用程序的来源。我们不会将我们存储在分析软件中的信息与您在应用程序中提供的个人身份信息相结合。我们如何使用Cookie、标识符及相关技术我们或我们的第三方合作伙伴，可能通过放置安全的Cookie、标识符及相关技术收集您的信息，以便为您提供更个性化的用户体验和服务。我们会严格要求第三方合作伙伴遵守本政策的相关规定。您也可以通过浏览器设置管理Cookie。但请注意，如果停用Cookie，您可能无法享受最佳的服务体验，某些服务也可能无法正常使用。若您希望了解更多Cookie的安全性等信息，可参见《Cookie政策说明》。您分享的信息您可以通过我们的服务与您的好友、家人及其他用户分享您的相关信息。例如，您在朋友圈中公开分享的文字和照片。请注意，这其中可能包含您的个人身份信息、个人财产信息等敏感信息。请您谨慎考虑披露您的相关个人敏感信息。您可通过我们服务中的隐私设置来控制您分享信息的范围，也可通过服务中的设置或我们提供的指引删除您公开分享的信息。但请您注意，这些信息仍可能由其他用户或不受我们控制的非关联第三方独立地保存。您如何管理自己的信息您可以在使用我们服务的过程中，访问、修改和删除您提供的注册信息和其他个人信息，也可按照通知指引与我们联系。您访问、修改和删除个人信息的范围和方式将取决于您使用的具体服务。例如，若您在使用地理位置相关服务时，希望停止分享您的地理位置信息，您可通过手机定位关闭功能、软硬件服务商及通讯服务提供商的关闭方式停止分享，建议您仔细阅读相关指引。我们将按照本政策所述，仅为实现我们产品或服务的功能，收集、使用您的信息。如您发现我们违反法律、行政法规的规定或者双方的约定收集、使用您的个人信息，您可以要求我们删除。<br />如您发现我们收集、存储的您的个人信息有错误的，您也可以要求我们更正。<br />请通过本政策列明的联系方式
      与我们联系
      。在您访问、修改和删除相关信息时，我们可能会要求您进行身份验证，以保障帐号的安全。请您理解，由于技术所限、法律或监管要求，我们可能无法满足您的所有要求，我们会在合理的期限内答复您的请求。我们分享的信息我们遵照法律法规的规定，对信息的分享进行严格的限制，例如：经您事先同意，我们可能与第三方分享您的个人信息我们需要向第三方合作伙伴等，分享已经匿名化或去标识化处理后的信息，要求其严格遵守我们关于数据隐私保护的措施与要求，包括但不限于根据数据保护协议、承诺书及相关数据处理政策进行处理，避免识别出个人身份，保障隐私安全。该等分享将主要用于以下用途：<br />向您提供我们的服务；<br />实现“我们如何使用收集的信息”部分所述目的；<br />履行我们在《服务协议》或本政策中的义务和行使我们的权利；<br />理解、维护和改善我们的服务。<br />我们不会向合作伙伴分享可用于识别您个人身份的信息（例如您的姓名或电子邮件地址），除非您明确授权。随着我们业务的持续发展，当发生合并、收购、资产转让等交易导致向第三方分享您的个人信息时，我们将通过推送通知、公告等形式告知您相关情形，按照法律法规及不低于本政策所要求的标准继续保护或要求新的管理者继续保护您的个人信息。我们会将所收集到的信息用于大数据分析。例如，我们将收集到的信息用于分析形成不包含任何个人信息的城市热力图或行业洞察报告。我们可能对外公开并与我们的合作伙伴分享经统计加工后不含身份识别内容的信息，用于了解用户如何使用我们服务或让公众了解我们服务的总体使用趋势。我们可能基于以下目的披露您的个人信息<br />·遵守适用的法律法规等有关规定；<br />·遵守法院判决、裁定或其他法律程序的规定；<br />·遵守相关政府机关或其他法定授权组织的要求；<br />·我们有理由确信需要遵守法律法规等有关规定；<br />·为执行相关服务协议或本政策、维护社会公共利益，为保护我们的客户、我们或我们的关联公司、其他用户或雇员的人身财产安全或其他合法权益合理且必要的用途。<br />我们可能向您发送的信息信息推送<br />您在使用我们的服务时，我们可能向您发送电子邮件、短信、资讯或推送通知。<br />您可以按照我们的相关提示，在设备上选择取消订阅。与服务有关的公告<br />我们可能在必要时（例如，因系统维护而暂停某一项服务时）向您发出与服务有关的公告。<br />您可能无法取消这些与服务有关、性质不属于广告的公告。存储信息的地点和期限存储信息的地点<br />我们遵守法律法规的规定，将境内收集的用户个人信息存储于境内。存储信息的期限<br />一般而言，我们仅为实现目的所必需的最短时间保留您的个人信息。但在下列情况下，我们有可能因需符合法律要求，更改个人信息的存储时间：<br />为遵守适用的法律法规等有关规定；<br />为遵守法院判决、裁定或其他法律程序的规定；<br />为遵守相关政府机关或法定授权组织的要求；<br />我们有理由确信需要遵守法律法规等有关规定；<br />为执行相关服务协议或本政策、维护社会公共利益，为保护们的客户、我们或我们的关联公司、其他用户或雇员的人身财产安全或其他合法权益所合理必需的用途。<br />当我们的产品或服务发生停止运营的情形时，我们将采取例如，推送通知、公告等形式通知您，并在合理的期限内删除或匿名化处理您的个人信息。信息安全我们为您的信息提供相应的安全保障，以防止信息的丢失、不当使用、未经授权访问或披露。我们严格遵守法律法规保护用户的通信秘密。我们将在合理的安全水平内使用各种安全保护措施以保障信息的安全。例如，我们使用加密技术（例如，TLS、
      SSL
      ）、匿名化处理等手段来保护您的个人信息。我们建立专门的管理制度、流程和组织确保信息安全。例如，我们严格限制访问信息的人员范围，要求他们遵守保密义务，并进行审查。若发生个人信息泄露等安全事件，我们会启动应急预案，阻止安全事件扩大，并以推送通知、公告等形式告知您。广告我们可能使用您的相关信息，在相关网站、应用及其他渠道向您提供与您更加相关的广告。您可以在关于广告页面中了解更多。未成年人保护我们非常重视对未成年人个人信息的保护。根据相关法律法规的规定，若您是18周岁以下的未成年人，在使用本网站的服务前，应事先取得您的家长或法定监护人的同意。我们有专门面向14周岁以下的儿童提供的产品或服务、产品或服务中包含专门面向儿童的功能板块，或者需要用户输入生日、年龄信息等能识别用户年龄的产品或服务。如您注册或使用这类产品或服务，根据相关法律法规的规定，若您是14周岁以下的儿童
      ，在使用相关的产品或服务前，应当按照注册、使用流程，事先取得您的家长或法定监护人的同意，并由您的家长或法定监护人帮助您完成产品或服务注册流程，以便您能使用我们提供的产品或服务。若您是儿童的监护人，当您在帮助儿童完成产品或服务的注册、使用前，应当仔细阅读本政策、产品具体的隐私保护指引（如有）和《儿童隐私保护声明》，决定是否同意本政策、产品具体的隐私保护指引（如有）和《儿童隐私保护声明》并帮助儿童进行注册、使用，以便儿童能使用我们提供的产品或服务。如您对您所监护的儿童的个人信息保护有相关疑问或权利请求时，请通过《儿童隐私保护声明》中的第七部分中披露的联系方式与我们联系。我们会在合理的时间内处理并回复您。适用范围我们的所有服务均适用本政策。某些服务有其特定的隐私指引/声明，该特定隐私指引/声明更具体地说明我们在该服务中如何处理您的信息。如本政策与特定服务的隐私指引/声明有不一致之处，请以该特定隐私指引声明为准。请您注意，本政策不适用由其他公司或个人提供的服务。例如，您通过使用第三方帐号登录其他公司或个人提供的服务。您使用该等第三方服务须受其隐私政策（而非本政策）约束，您需要仔细阅读其政策内容。联系我们如您对本政策或其他相关事宜有疑问，请通过网站私信功能与管理员联系。
    </span>

    <div id="submitBtnBg">
      <img
        v-if="isLogin != 4 && isLogin != 5"
        src="../../assets/logo.png"
        style="width: 25%; border-radius: 15px; object-fit: contain"
      />
      <div id="bank" v-if="isLogin == 1" style="height: 165px">
        <nut-row style="margin-top: 4%">
          <nut-col :span="24" class="textStyle">
            <nut-input
              v-model="loginUserPhone"
              label="手机号："
              :border="false"
              placeholder="请输入手机号"
            />
          </nut-col>
        </nut-row>
        <nut-row style="margin-top: 4%">
          <nut-col :span="24" class="textStyle">
            <nut-input
              v-model="loginUserPwd"
              type="password"
              label="密码："
              :border="false"
              placeholder="请输入密码"
            />
          </nut-col>
        </nut-row>
        <nut-row style="margin-top: 6%">
          <nut-col :span="12" class="leftTextStyle">
            <div class="rememberBtnBg" @click="rememberPwd = !rememberPwd">
              <img
                v-if="rememberPwd"
                src="../../assets/login_sel.jpg"
                style="width: 15px; height: 15px"
              />
              <img
                v-if="!rememberPwd"
                src="../../assets/login_def.jpg"
                style="width: 15px; height: 15px"
              />
              <span class="rememberBtn">记住密码</span>
            </div>
          </nut-col>
          <nut-col :span="12" class="textStyle">
            <div @click="isLogin = 3" class="forgotBtn">忘记密码？</div>
          </nut-col>
        </nut-row>
      </div>

      <div id="bank" v-if="isLogin == 2" style="height: 260px">
        <nut-row class="rowm-margin-top">
          <nut-col :span="20" class="textStyle">
            <nut-input
              v-model="registerUserName"
              label="用户名："
              :border="false"
              placeholder="请输入用户姓名"
            />
          </nut-col>
        </nut-row>
        <nut-row class="rowm-margin-top">
          <nut-col :span="20" class="textStyle">
            <nut-input
              v-model="registerUserPhone"
              label="手机号："
              :border="false"
              placeholder="请输入手机号"
            />
          </nut-col>
        </nut-row>
        <nut-row class="rowm-margin-top">
          <nut-col :span="20" class="textStyle">
            <nut-input
              v-model="registerSmsCode"
              label="验证码："
              :border="false"
              placeholder="请输入验证码"
            />
          </nut-col>
          <nut-col :span="4" class="textStyle sendSmsStyle">
            <nut-button
              v-if="!isCountDown"
              size="mini"
              plain
              type="info"
              style="margin-right: 50px"
              @click="sendSmsCode(true)"
              >发送验证码</nut-button
            >
            <span
              v-else-if="isCountDown"
              class="countDown textStyle sendSmsStyle"
              >{{ countDownTime }}秒</span
            >
          </nut-col>
        </nut-row>
        <nut-row class="rowm-margin-top">
          <nut-col :span="20" class="textStyle">
            <nut-input
              type="password"
              v-model="registerUserPwd"
              :border="false"
              label="密&nbsp&nbsp&nbsp码："
              placeholder="请输入登录密码"
            />
          </nut-col>
        </nut-row>
        <nut-row class="rowm-margin-top">
          <nut-col :span="20" class="textStyle">
            <nut-input
              v-model="registerInviteNum"
              label="邀请码："
              :border="false"
              placeholder="请输入邀请码"
            />
          </nut-col>
        </nut-row>
      </div>

      <div id="bank" v-if="isLogin == 3" style="height: 165px">
        <nut-row class="rowm-margin-top">
          <nut-col :span="20" class="textStyle">
            <nut-input
              v-model="forgotUserPhone"
              label="手机号："
              :border="false"
              placeholder="请输入手机号"
            />
          </nut-col>
        </nut-row>
        <nut-row class="rowm-margin-top">
          <nut-col :span="20" class="textStyle">
            <nut-input
              v-model="forgotSmsCode"
              label="验证码："
              :border="false"
              placeholder="请输入验证码"
            />
          </nut-col>
          <nut-col :span="4" class="textStyle sendSmsStyle">
            <nut-button
              v-if="!isCountDown"
              size="mini"
              plain
              type="info"
              style="margin-right: 50px"
              @click="sendSmsCode(false)"
              >发送验证码</nut-button
            >
            <span
              v-else-if="isCountDown"
              class="countDown textStyle sendSmsStyle"
              >{{ countDownTime }}秒</span
            >
          </nut-col>
        </nut-row>
        <nut-row class="rowm-margin-top">
          <nut-col :span="20" class="textStyle">
            <nut-input
              type="password"
              :border="false"
              v-model="forgotUserPwd"
              label="密&nbsp&nbsp&nbsp码："
              placeholder="请输入登录密码"
            />
          </nut-col>
        </nut-row>
      </div>

      <div style="width: 100%">
        <nut-button
          id="submitBtn"
          v-if="isLogin == 1"
          type="primary"
          @click="login"
          >登录</nut-button
        >
        <nut-row v-if="isLogin == 1">
          <nut-col :span="24" class="registerTextStyle">
            还没有账号？
            <span @click="isLogin = 2" class="registerBtn">立即注册</span>
          </nut-col>
        </nut-row>
        <nut-button
          id="submitBtn"
          v-if="isLogin == 2"
          type="info"
          @click="register"
          >注册</nut-button
        >
        <nut-button
          id="submitBtn"
          v-if="isLogin == 3"
          type="info"
          @click="forgot"
          >找回密码</nut-button
        >

        <nut-row v-if="isLogin != 4 && isLogin != 5">
          <nut-col :span="24" class="registerTextStyle">
            <div class="dealBtnBg" @click="isDeal = !isDeal">
              <img
                v-if="isDeal"
                src="../../assets/login_sel.jpg"
                style="width: 15px; height: 15px"
              />
              <img
                v-if="!isDeal"
                src="../../assets/login_def.jpg"
                style="width: 15px; height: 15px"
              />
              <span class="rememberBtn">已阅读且同意</span>
              <div @click.stop="isLogin = 4" class="dealBtn">
                《用户注册协议》
              </div>
              <span class="rememberBtn">和</span>
              <div @click.stop="isLogin = 5" class="dealBtn">《隐私协议》</div>
            </div>
          </nut-col>
        </nut-row>
      </div>
    </div>

    <div v-if="isLogin != 4 && isLogin != 5" style="font-size: 12px">
      ©2022 洛耀生 All rights reserved.
    </div>
  </div>
</template>

<script>
// import md5 from 'js-md5'
// import { http, system } from '@/utils/http.js'
import CryptoJS from 'crypto-js'

export default {
  name: 'Login',
  data() {
    return {
      isLogin: 1, // 1：login，2.register，3.forgot，4、5.deal
      loginUserPhone: '',
      loginUserPwd: '',
      registerUserName: '',
      registerUserPhone: '',
      registerSmsCode: '',
      registerUserPwd: '',
      registerInviteNum: '',

      forgotUserPhone: '',
      forgotSmsCode: '',
      forgotUserPwd: '',

      isCountDown: false,
      countDownTime: 60,
      rememberPwd: true,
      isDeal: true,
      aseKey: 'QaZ1,#*]'
    }
  },
  created() {
    // setTimeout(() => {
    //   var code = this.$route.query.code

    //   if (code != undefined) {
    //     this.isLogin = 2
    //     this.registerInviteNum = code
    //   }
    // }, 0)

    var username = localStorage.getItem('loginUsername')
    var pwd = localStorage.getItem('loginPWD')

    if (username != 'null' && username != null) {
      this.loginUserPhone = username

      var decrypt = CryptoJS.AES.decrypt(
        pwd,
        CryptoJS.enc.Utf8.parse(this.aseKey),
        {
          mode: CryptoJS.mode.ECB,
          padding: CryptoJS.pad.Pkcs7
        }
      ).toString(CryptoJS.enc.Utf8)

      this.loginUserPwd = decrypt
    }
  },
  methods: {
    sendSmsCode(isRegister) {
      this.isCountDown = true

      var interval = setInterval(() => {
        this.countDownTime -= 1

        if (this.countDownTime == 0) {
          clearInterval(interval)

          this.countDownTime = 60
          this.isCountDown = false
        }
      }, 1000)

      // let that = this

      // http
      //   .$get(system.user + 'send_sms', {
      //     phone: isRegister ? this.registerUserPhone : this.forgotUserPhone
      //   })
      //   .then((res) => {
      //     if (res.status != 1) {
      //       that.$toast.fail(res.msg)
      //       return
      //     }

      //     that.$toast.success(res.msg)
      //   })
    },
    register() {
      if (!this.isDeal) {
        this.$toast.fail('您未同意注册及隐私协议')
        return
      }

      // let that = this

      // http
      //   .$get(system.user + 'register', {
      //     name: this.registerUserName,
      //     phone: this.registerUserPhone,
      //     sms: this.registerSmsCode,
      //     pwd: md5(this.registerUserPwd),
      //     invite_code: this.registerInviteNum
      //   })
      //   .then((res) => {
      //     if (res.status != 1) {
      //       that.$toast.fail(res.msg)
      //       return
      //     }

      //     that.$toast.success(res.msg)
      //     that.isLogin = 1
      //   })
    },
    forgot() {
      if (!this.isDeal) {
        this.$toast.fail('您未同意注册及隐私协议')
        return
      }

      // let that = this

      // http
      //   .$get(system.user + 'modify_pwd', {
      //     phone: this.forgotUserPhone,
      //     sms: this.forgotSmsCode,
      //     pwd: md5(this.forgotUserPwd)
      //   })
      //   .then((res) => {
      //     if (res.status != 1) {
      //       that.$toast.fail(res.msg)
      //       return
      //     }

      //     that.$toast.success(res.msg)
      //     that.isLogin = 1
      //   })
    },
    login() {
      if (!this.isDeal) {
        this.$toast.fail('您未同意注册及隐私协议')
        return
      }

      this.$toast.success('登录后跳转到选项卡页')

      // let that = this

      // that.$toast.loading({
      //   message: '正在登录',
      //   forbidClick: true
      // })

      // http
      //   .$get(system.user + 'login', {
      //     phone: this.loginUserPhone,
      //     pwd: md5(this.loginUserPwd)
      //   })
      //   .then((res) => {
      //     if (res.status != 1) {
      //       that.$toast.fail(res.msg)
      //       return
      //     }

      //     localStorage.setItem('accessToken', res.token)
      //     localStorage.setItem('customerServiceQR', res.kf_qr)

      //     localStorage.setItem(
      //       'loginUsername',
      //       that.rememberPwd ? this.loginUserPhone : null
      //     )

      //     if (that.rememberPwd) {
      //       var encrypt = CryptoJS.AES.encrypt(
      //         that.loginUserPwd,
      //         CryptoJS.enc.Utf8.parse(that.aseKey),
      //         {
      //           mode: CryptoJS.mode.ECB,
      //           padding: CryptoJS.pad.Pkcs7
      //         }
      //       ).toString()

      //       localStorage.setItem('loginPWD', encrypt)
      //     } else {
      //       localStorage.setItem('loginPWD', null)
      //     }

      //     that.$toast.clear()
      //     this.$emit('loginSuccess')
      //   })
    }
  }
}
</script>

<style scoped>
#bg {
  width: 96%;
  height: 98%;
  position: absolute;
  display: flex;
  overflow: scroll;
  flex-direction: column;
}
.dealSpan {
  text-align: left;
  font-size: 13px;
  padding: 10px;
}
.loginStyle {
  font-weight: bolder;
  margin-top: 20px;
  font-size: 20px;
}
.textStyle {
  font-weight: bolder;
  text-align: right;
  height: 35px;
}
.leftTextStyle {
  font-weight: bolder;
  text-align: left;
  height: 35px;
}
.registerTextStyle {
  display: flex;
  justify-content: center;
  align-items: center;
  font-weight: bolder;
  font-size: 13px;
  height: 35px;
}
.registerBtn {
  font-size: 13px;
  color: #5ac8fa;
}
.dealBtn {
  padding-left: 0px;
  padding-right: 0px;
  font-size: 13px;
  color: #5ac8fa;
}
.rememberBtnBg {
  display: flex;
  align-items: center;
  margin-top: 2px;
  margin-left: 23px;
}
.dealBtnBg {
  display: flex;
  justify-content: center;
  align-items: center;
  margin-top: 2px;
  margin-left: 18px;
}
.forgotBtn {
  color: #5ac8fa;
  margin-right: 20px;
  font-size: 13px;
}
.rememberBtn {
  color: #333333;
  font-weight: bolder;
  margin-left: 4px;
  font-size: 13px;
}
#bank {
  border-radius: 15px;
  box-shadow: 0px 0px 10px #dddddd;
  display: flex;
  flex-direction: column;
  margin-left: 20px;
  margin-right: 20px;
}
.sendSmsStyle {
  display: flex;
  justify-content: center;
  align-items: center;
}
.rowm-margin-top {
  margin-top: 3%;
}
.countDown {
  height: 25px;
  border-radius: 12px;
  margin-right: 5px;
  padding-left: 12px;
  padding-right: 12px;
  padding-top: 2px;
  padding-bottom: 2px;
  color: cadetblue;
  background-color: #eeeeee;
  font-size: 12px;
}
#submitBtnBg {
  flex: 1;
  display: flex;
  flex-direction: column;
  font-weight: bolder;
  align-items: center;
  justify-content: space-evenly;
}
#submitBtn {
  width: 85%;
  border-radius: 14px;
}
</style>

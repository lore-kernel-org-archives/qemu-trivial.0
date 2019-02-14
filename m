Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1guDVs-0002iF-PB
	for mharc-qemu-trivial@gnu.org; Thu, 14 Feb 2019 04:41:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60353)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guDVq-0002fZ-7z
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 04:40:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1guDVp-00047e-D2
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 04:40:58 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:49431)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1guDVU-000386-7m; Thu, 14 Feb 2019 04:40:40 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1MhToz-1hYCpB122N-00egjW; Thu, 14 Feb 2019 10:40:22 +0100
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, "Daniel P. Berrange" <berrange@redhat.com>
References: <1549545296-18903-1-git-send-email-thuth@redhat.com>
	<1549545296-18903-2-git-send-email-thuth@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <77ac6284-b74b-454a-7d46-695679ef1caf@vivier.eu>
Date: Thu, 14 Feb 2019 10:40:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1549545296-18903-2-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:5BypzQ9U0vi5OR8Fxc4f7xqAADDrW/JJ+Y3XTgFdkSFobJ48jyh
	1EVGm6ROZP3Let7+lZGpt/J5YG3uqMdmsWPJ64ETFSndpPTLITAoYtGfBv5Bg4KXYfkMAZQ
	rhIhhJvCUT7XJH1StNg/wXMDLUrePViUgPqtauwBxApunT/6kS6wy667raJltVrZFG+dgW+
	5zJ7zctk2HWvXk8/37eYQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:RoS6G4Tc5mI=:uqtHfnYDBh+d9TXHlSMmO5
	3lxHJnrSJyTIh6lT7u1D4sRdD05/OPsGTc3+yPCikbDFuCnWRwyJUdPXDKPXFRuZMQmp7JsyQ
	7PLl3wWZ5yC5f0vPDzIq5yZP5mZxpF0kPCXw3HBheEXTkr7Q2bOHXCxOnLok09Itz8YadRYxc
	QT1ieCKBkgTFmjEQ+OcM3ctLxzj/vtpHZANlSjWJmmbDlOs9vNsyjl5JNGgmOBGLcWtHux82S
	EkElMouhJspDSEDzxOcv6YVKXYsBuWnAme6de19x0B8u5Gx7Z/r9WBirEXTocqPISnzR/V7Yo
	/Dt9VwXLAiD2JKFMuey6wmwvRKHcXtuP1/ksHDqkbcsCEGE/B0F89995LFSycohKd+JPI6evn
	VMllpKaeUKe+vDjCAXHosJAijtmNmVnlIthrzHs7ax8QC57BgjOIUmcWWPL77LLCRQMpZJKbe
	PQfUh28MIxfFOySFiY76rjRqPOuG6GaHUyWIOJaqKbZ9ZkPbvgXEzJa+2uQNo1K2g6JuLobpx
	ChDEF3LX9tqQV2NVt3wbRpRBMCZb1mMB85hohKwOFljmcZ6xuIq+u/5+y/Z8Owo4iHChRybRw
	c2ov/gIhSbR9NjvIHR+xBdm6ALBUiwi/jD1AqvdelKRHG8lFuWegBF1NZkd175XlHFWUhY+yL
	b1avAEmjiRIi6nePlj7+W+NSWFvFwrUyRCrWzX03YikRp/d1rmGnAzbZTyhFe9Wnpa5KIyUZy
	EAr7zgsh2jumzI0W52yJKyQ5yMWXnryB1rGi0L4LAYztqbOhpUYL0cYGyUo=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.10
Subject: Re: [Qemu-trivial] [PATCH 1/2] qemu-deprecated: Remove
 -virtioconsole and -no-frame for good
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Feb 2019 09:40:59 -0000

On 07/02/2019 14:14, Thomas Huth wrote:
> The two sections have accidentally been added again during the
> merge of Paolo's and Gerd's trees.
> 
> Fixes: 3e29da9fd81002a0c03041aaa26dea6d9dd9bd65
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  qemu-deprecated.texi | 12 ------------
>  1 file changed, 12 deletions(-)
> 
> diff --git a/qemu-deprecated.texi b/qemu-deprecated.texi
> index 80b0702..90e5860 100644
> --- a/qemu-deprecated.texi
> +++ b/qemu-deprecated.texi
> @@ -37,18 +37,6 @@ would automatically enable USB support on the machine type.
>  If using the new syntax, USB support must be explicitly
>  enabled via the ``-machine usb=on'' argument.
>  
> -@subsection -virtioconsole (since 3.0.0)
> -
> -Option @option{-virtioconsole} has been replaced by
> -@option{-device virtconsole}.
> -
> -@subsection -no-frame (since 2.12.0)
> -
> -The @code{--no-frame} argument works with SDL 1.2 only. The other user
> -interfaces never implemented this in the first place. So this will be
> -removed together with SDL 1.2 support.
> ->>>>>>> remotes/bonzini/tags/for-upstream
> -
>  @subsection -clock (since 3.0.0)
>  
>  The @code{-clock} option is ignored since QEMU version 1.7.0. There is no
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


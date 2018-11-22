Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPqyG-0004aF-H7
	for mharc-qemu-trivial@gnu.org; Thu, 22 Nov 2018 10:32:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39536)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gPqyD-0004RY-H0
	for qemu-trivial@nongnu.org; Thu, 22 Nov 2018 10:32:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gPqy9-00034C-8c
	for qemu-trivial@nongnu.org; Thu, 22 Nov 2018 10:32:45 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:60821)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gPqtB-0005OI-44; Thu, 22 Nov 2018 10:27:33 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1M1INQ-1gRUVp0c1q-002sfT; Thu, 22 Nov 2018 16:27:27 +0100
To: Thomas Huth <thuth@redhat.com>, Chris Wulff <crwulff@gmail.com>,
	Marek Vasut <marex@denx.de>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <1542899500-23346-1-git-send-email-thuth@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <c74fe488-cb98-33d0-3675-be377644df64@vivier.eu>
Date: Thu, 22 Nov 2018 16:27:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1542899500-23346-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:9xLvxKMdkH3blJHwFVJ7Jo0HbCUpg6wmZ90D5jX2TOqDmU7Nk0e
	EG4S1GyLHqN/gOgpbVSHHU2tIDNEGbvIsktu9+vOv5lNo9/jXGh1uiSxhkzs+ZoiHVWNyjO
	yFFTDadQZIvC8Ibt7eqYYX840lOkkUuJ34uBPaYpGAUDjJs5Fyuh+GHxCiYUV8+hD9OlA7P
	Cx1J1vpJt2TyIuThGwDrg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qJn7LLsNnHA=:QOOjKl/xDoaJ7zr8griRVB
	vNeXUWBByWgmiRzcPNmiTomfkVTUm04hKL/QRQY81Xw4XltEMOy/yeu6fC1lvjxITj0ywo1B9
	2AStlPWPYtTpzvFZxMGhejdjAPGCSCBDzydl0lpJwU9inmGaQeZznbmnjQwU7lTHZpLO5o6IK
	1dQ0doVLT3ukeaWJeTykFLw9zEoBb0GrqniukCMDXFsQ4Wjvw9RpMyBY2G0aA6fSuxPI193Rw
	bU8ilE2JhUeqXoI3nGVgP/gHYKyPPa4/cri5+vZ/2vqi6QUKbH+aLgN/2u6DuXKOs6CywfkV4
	wVzivjqg7hNz4+Dh34jvwtrp1kcZ0E9Sv7l2k4XKQvtg5ZBqj7E16Ce6au0qF+4/E3fOZHv+f
	VtKYHFHm5bil34ED4nPQ3ojx3pMfTkoIPSJDUroiicUNFGv9/cPFDdMYNLXjQlmyX27vZONuK
	g3egl1Fc6kswJkZs96NiYdWJCcFwu30uS1PPG85k+dpUHuPpdNzymEqSGp8WCWDHaTeciQe1X
	/EOS/iAZjnS3NsTiYs0P6sU0CnWvgAj3HnAWVvoA6B77sbm+756y+7+OJ/JAk87FsvwLpEmQ1
	7TbVRumL94EZoONTsR9bgoanjgK7PLGTu/qQIzj6KAyVpMs1051XxHBYmu8mUMEcHYke2R/cz
	bWn82e3+rdIX9HJvQrAlqgBLucsBuuB2MKMdXt3TYmF74g9onpXjjs87ckW5BAKZKnFh9cFxP
	V/Z1fIb+QR2Szg+Itny+02t7a7teB8DxAhHFye/lf/l6E8xsQvTdRPvI9iIdJHhIk+GkVi0WJ
	rDJOsqrFwj9EzDdguvNWv3n8ezpCA==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.10
Subject: Re: [Qemu-trivial] [PATCH] MAINTAINERS: Add nios2-related files to
 the Nios2 section
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
X-List-Received-Date: Thu, 22 Nov 2018 15:32:47 -0000

On 22/11/2018 16:11, Thomas Huth wrote:
> nios2_iic.c and the default-configs/nios2-softmmu.mak file are
> currently "unmaintained" according to the get_maintainers.pl script.
> Move them to the Nios2 section where they obviously belong to.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1291c07..33245b4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -226,7 +226,9 @@ M: Marek Vasut <marex@denx.de>
>  S: Maintained
>  F: target/nios2/
>  F: hw/nios2/
> +F: hw/intc/nios2_iic.c
>  F: disas/nios2.c
> +F: default-configs/nios2-softmmu.mak
>  
>  OpenRISC
>  M: Stafford Horne <shorne@gmail.com>
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>



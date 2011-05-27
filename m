Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QQ138-0000oQ-IE
	for mharc-qemu-trivial@gnu.org; Fri, 27 May 2011 13:42:14 -0400
Received: from eggs.gnu.org ([140.186.70.92]:49937)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weil@mail.berlios.de>) id 1QQ136-0000nR-71
	for qemu-trivial@nongnu.org; Fri, 27 May 2011 13:42:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <weil@mail.berlios.de>) id 1QQ135-0007Th-7h
	for qemu-trivial@nongnu.org; Fri, 27 May 2011 13:42:12 -0400
Received: from moutng.kundenserver.de ([212.227.126.187]:53668)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weil@mail.berlios.de>)
	id 1QQ134-0007T1-QX; Fri, 27 May 2011 13:42:11 -0400
Received: from flocke.weilnetz.de (p5086FC6B.dip.t-dialin.net [80.134.252.107])
	by mrelayeu.kundenserver.de (node=mrbap4) with ESMTP (Nemesis)
	id 0MbxnK-1Q6hTd0jpu-00JHCL; Fri, 27 May 2011 19:42:07 +0200
Received: from localhost ([127.0.0.1] ident=stefan)
	by flocke.weilnetz.de with esmtp (Exim 4.72)
	(envelope-from <weil@mail.berlios.de>)
	id 1QQ130-0001T4-Bj; Fri, 27 May 2011 19:42:06 +0200
Message-ID: <4DDFE26E.8090803@mail.berlios.de>
Date: Fri, 27 May 2011 19:42:06 +0200
From: Stefan Weil <weil@mail.berlios.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20110307 Iceowl/1.0b1 Icedove/3.0.11
MIME-Version: 1.0
To: Alexandre Raymond <cerbere@gmail.com>
References: <1306516951-31105-1-git-send-email-cerbere@gmail.com>
	<1306516951-31105-4-git-send-email-cerbere@gmail.com>
In-Reply-To: <1306516951-31105-4-git-send-email-cerbere@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V02:K0:gpn4xkovd3Ja2yjnZg3hMYn3pq+yXHP/h4jEU/mAi8K
	fdb5w0hMMEEtBg6gRX/b/MnRhV0kWzmiq7/6vw8mn/ejVmnlDl
	5XFRxTigDjw/rWlzq9bwbhF33W1KmBUebqf55tvQi30H5R6/HC
	7fw6ItkerV1WWxw4P/iGHb8B/lzJh7LUtRp7mxo05fZ4swOa84
	xzDcd0NLt/3Df9zMLLMpNLkDCYzL42gFEdAhL2y0G2Y7rScKxJ 6gc0SUcOpBjLl
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.227.126.187
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 3/6] Fix compilation warning
 due to incorrectly specified type
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 27 May 2011 17:42:12 -0000

Am 27.05.2011 19:22, schrieb Alexandre Raymond:
> In audio/coreaudio.c, a variable named "str" was assigned "const char" values,
> which resulted in the following warnings:
>
> -----8<-----
> audio/coreaudio.c: In function ‘coreaudio_logstatus’:
> audio/coreaudio.c:59: warning: initialization discards qualifiers from pointer target type
> audio/coreaudio.c:63: warning: assignment discards qualifiers from pointer target type
> (...)
> -----8<-----
>
> Signed-off-by: Alexandre Raymond<cerbere@gmail.com>
> ---
>   audio/coreaudio.c |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/audio/coreaudio.c b/audio/coreaudio.c
> index 0a26413..3bd75cd 100644
> --- a/audio/coreaudio.c
> +++ b/audio/coreaudio.c
> @@ -56,7 +56,7 @@ typedef struct coreaudioVoiceOut {
>
>   static void coreaudio_logstatus (OSStatus status)
>   {
> -    char *str = "BUG";
> +    const char *str = "BUG";
>
>       switch(status) {
>       case kAudioHardwareNoError:
>    

Acked-by: Stefan Weil <weil@mail.berlios.de>



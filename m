Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TLz62-0004tL-62
	for mharc-qemu-trivial@gnu.org; Wed, 10 Oct 2012 12:25:22 -0400
Received: from eggs.gnu.org ([208.118.235.92]:60222)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1TLz5z-0004mA-Pl
	for qemu-trivial@nongnu.org; Wed, 10 Oct 2012 12:25:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1TLz5q-0007YW-9t
	for qemu-trivial@nongnu.org; Wed, 10 Oct 2012 12:25:19 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:41499)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1TLz5a-0007CK-1t; Wed, 10 Oct 2012 12:24:54 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	893A27280041; Wed, 10 Oct 2012 18:24:53 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id NvI8VVS3IZsg; Wed, 10 Oct 2012 18:24:53 +0200 (CEST)
Received: from [192.168.178.20] (p5086E9D6.dip.t-dialin.net [80.134.233.214])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	DA261728003D; Wed, 10 Oct 2012 18:24:52 +0200 (CEST)
Message-ID: <5075A154.6000806@weilnetz.de>
Date: Wed, 10 Oct 2012 18:24:52 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:15.0) Gecko/20120912 Thunderbird/15.0.1
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1349885969-25866-1-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1349885969-25866-1-git-send-email-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2] virtfs-proxy-helper: check return
	code of setfsgid/setfsuid
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
X-List-Received-Date: Wed, 10 Oct 2012 16:25:21 -0000

Am 10.10.2012 18:19, schrieb Paolo Bonzini:
> Fixes the following error with glibc 2.16 on Fedora 18:
>
> virtfs-proxy-helper.c: In function =E2=80=98setfsugid=E2=80=99:
> virtfs-proxy-helper.c:293:13: error: ignoring return value of =E2=80=98=
setfsgid=E2=80=99, declared with attribute warn_unused_result [-Werror=3D=
unused-result]
> virtfs-proxy-helper.c:294:13: error: ignoring return value of =E2=80=98=
setfsuid=E2=80=99, declared with attribute warn_unused_result [-Werror=3D=
unused-result]
> cc1: all warnings being treated as errors
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   fsdev/virtfs-proxy-helper.c | 8 ++++++--
>   1 file modificato, 6 inserzioni(+), 2 rimozioni(-)
>
> diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
> index f9a8270..9060743 100644
> --- a/fsdev/virtfs-proxy-helper.c
> +++ b/fsdev/virtfs-proxy-helper.c
> @@ -290,8 +290,12 @@ static int setfsugid(int uid, int gid)
>           CAP_DAC_OVERRIDE,
>       };
>  =20
> -    setfsgid(gid);
> -    setfsuid(uid);
> +    if (setfsgid(gid) < 0) {
> +        return -1;
> +    }
> +    if (setfsuid(uid) < 0) {
> +        return -1;
> +    }
>  =20
>       if (uid !=3D 0 || gid !=3D 0) {
>           return do_cap_set(cap_list, ARRAY_SIZE(cap_list), 0);

You are too fast for me :-)

Patch v3 is needed, see my other mail.

Stefan



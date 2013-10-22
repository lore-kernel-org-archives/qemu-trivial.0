Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VYYEn-0001TL-G3
	for mharc-qemu-trivial@gnu.org; Tue, 22 Oct 2013 05:26:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58271)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex@alex.org.uk>) id 1VYYEh-0001ML-S6
	for qemu-trivial@nongnu.org; Tue, 22 Oct 2013 05:26:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex@alex.org.uk>) id 1VYYEc-0007FF-HD
	for qemu-trivial@nongnu.org; Tue, 22 Oct 2013 05:26:47 -0400
Received: from mail.avalus.com ([89.16.176.221]:57369)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex@alex.org.uk>) id 1VYYEc-0007FB-BJ
	for qemu-trivial@nongnu.org; Tue, 22 Oct 2013 05:26:42 -0400
Received: by mail.avalus.com (Postfix) with ESMTPSA id 78D94C561AB;
	Tue, 22 Oct 2013 10:26:29 +0100 (BST)
Date: Tue, 22 Oct 2013 10:26:28 +0100
From: Alex Bligh <alex@alex.org.uk>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <7863EB11B2F7575807D316E3@nimrod.local>
In-Reply-To: <1375814713-27542-1-git-send-email-alex@alex.org.uk>
References: <1375814713-27542-1-git-send-email-alex@alex.org.uk>
X-Mailer: Mulberry/4.0.8 (Mac OS X)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 89.16.176.221
Cc: Alex Bligh <alex@alex.org.uk>
Subject: Re: [Qemu-trivial] [PATCH] audio/mixeng_template.h: fix inline
	declaration
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
Reply-To: Alex Bligh <alex@alex.org.uk>
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Oct 2013 09:26:53 -0000

ping

I think this is should go to qemu-trivial

--On 6 August 2013 19:45:13 +0100 Alex Bligh <alex@alex.org.uk> wrote:

> Fix error: =E2=80=98inline=E2=80=99 is not at beginning of declaration
> [-Werror=3Dold-style-declaration]
>
> Signed-off-by: Alex Bligh <alex@alex.org.uk>
> ---
>  audio/mixeng_template.h |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/audio/mixeng_template.h b/audio/mixeng_template.h
> index 30849a6..77cc89b 100644
> --- a/audio/mixeng_template.h
> +++ b/audio/mixeng_template.h
> @@ -35,7 +35,7 @@
>  #define IN_T glue (glue (ITYPE, BSIZE), _t)
>
>  #ifdef FLOAT_MIXENG
> -static mixeng_real inline glue (conv_, ET) (IN_T v)
> +static inline mixeng_real glue (conv_, ET) (IN_T v)
>  {
>      IN_T nv =3D ENDIAN_CONVERT (v);
>
> @@ -54,7 +54,7 @@ static mixeng_real inline glue (conv_, ET) (IN_T v)
>  #endif
>  }
>
> -static IN_T inline glue (clip_, ET) (mixeng_real v)
> +static inline IN_T glue (clip_, ET) (mixeng_real v)
>  {
>      if (v >=3D 0.5) {
>          return IN_MAX;
> --
> 1.7.9.5
>
>



--=20
Alex Bligh


Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aw8tG-0006Xw-Lu
	for mharc-qemu-trivial@gnu.org; Fri, 29 Apr 2016 09:55:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50199)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aw8t9-0006Fe-6c
	for qemu-trivial@nongnu.org; Fri, 29 Apr 2016 09:55:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aw8sx-00020P-Ht
	for qemu-trivial@nongnu.org; Fri, 29 Apr 2016 09:55:17 -0400
Received: from mail-yw0-x229.google.com ([2607:f8b0:4002:c05::229]:33166)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aw8sw-0001qH-CV
	for qemu-trivial@nongnu.org; Fri, 29 Apr 2016 09:55:11 -0400
Received: by mail-yw0-x229.google.com with SMTP id t10so189351589ywa.0
	for <qemu-trivial@nongnu.org>; Fri, 29 Apr 2016 06:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=WVLbO/oMlfGh3oMgJyfPcYCES2RnPHUe8NOmaF9ZTQg=;
	b=MpcmrrbJXCZTvsj9VipwuA7336hERtkPCeBBJTKCOzjXCp3+VApEkJD91VjA49/I+P
	5N8E+/LsxZmtzhbYl/hEMxOAZNp5QdCeDwsjxU1CThFvCxMIjL/C2N8meYWIDBoAxBuW
	d3Ela6J/BpR9GD8+ccnV87IoO/CZ8+tyklEDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=WVLbO/oMlfGh3oMgJyfPcYCES2RnPHUe8NOmaF9ZTQg=;
	b=MpyG+LC3DI3q/jG2pqTGhZufZxYOYa9LJp3JU6u28xwdHDHKCBPtE09DBykeevCBmL
	StDuMN9kqyjra8nB1Hl0LPKG5VgjmOtdJIcm/RryFjkFf8XsxdTDbtOjrQiGtKJD3gzv
	EFQTffUPRMVX1/DJDk2bbpmehir5YowhY8ulCDN8/r03XiRntek8Dljo7PrcInU4D5z2
	ULN6uiuIiwjitQreIKpSjQVXZlXJNFTtYrx3IU71gh6iuXYGV05XOwpR06T2Jz2xskQt
	+0nymycjemNA3979E9X2yg3P6OIN2zBIi7NX0ohgi/R9E3kMdlFFkKNq3ynPIozP9wd2
	lgfA==
X-Gm-Message-State: AOPr4FUVFYZIiFEXrerGp+1WOQRo7mJ70+ZDegwlnzuKehLvf/bE7qVifFxrwgFwIqVWHxZmhqSo8Fe845c4OAZv
X-Received: by 10.176.6.100 with SMTP id f91mr10966543uaf.38.1461938088358;
	Fri, 29 Apr 2016 06:54:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Fri, 29 Apr 2016 06:54:28 -0700 (PDT)
In-Reply-To: <1461935279-30418-1-git-send-email-jano.vesely@gmail.com>
References: <1461935279-30418-1-git-send-email-jano.vesely@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 Apr 2016 14:54:28 +0100
Message-ID: <CAFEAcA-yNp8wGnyzMrTu=28g4vYPv-5F-PJ4aeHq8xSnxRZLkA@mail.gmail.com>
To: Jan Vesely <jano.vesely@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Markus Armbruster <armbru@redhat.com>, Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4002:c05::229
Subject: Re: [Qemu-trivial] [PATCH] configure: Check if struct fsxattr is
 available from linux header
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
X-List-Received-Date: Fri, 29 Apr 2016 13:55:29 -0000

On 29 April 2016 at 14:07, Jan Vesely <jano.vesely@gmail.com> wrote:
> Fixes build failure with --enable-xfsctl and
> new linux headers (>=3D4.5) and older xfsprogs(<4.5):
> In file included from /usr/include/xfs/xfs.h:38:0,
>                  from /var/tmp/portage/app-emulation/qemu-2.5.0-r1/work/q=
emu-2.5.0/block/raw-posix.c:97:
> /usr/include/xfs/xfs_fs.h:42:8: error: redefinition of =E2=80=98struct fs=
xattr=E2=80=99
>  struct fsxattr {
>         ^
> In file included from /var/tmp/portage/app-emulation/qemu-2.5.0-r1/work/q=
emu-2.5.0/block/raw-posix.c:60:0:
> /usr/include/linux/fs.h:155:8: note: originally defined here
>  struct fsxattr {
>
> CC: qemu-trivial@nongnu.org
> CC: Markus Armbruster <armbru@redhat.com>
> CC: Peter Maydell <peter.maydell@linaro.org>
> CC: Stefan Weil <sw@weilnetz.de>
> Signed-off-by: Jan Vesely <jano.vesely@gmail.com>
> ---
> One can argue that the failure only happens for invalid linux-headers,
> xfsprogs combinations, feel free to reject the patch in that case.
>
> This patch relies on functionality introduced in
> 559607ea173 io: add QIOChannelSocket class
>
>  configure | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)

Hi; thanks for this patch. I'm a bit confused by it:

> +if test "$have_fsxattr" =3D "yes" ; then
> +    echo "HAVE_FSXATTR=3Dy" >> $config_host_mak
> +fi

This means we'll build with a HAVE_FSXATTR define set, but
nothing in the tree tries to use that as far as I can tell:
"git grep HAVE_FSXATTR" returns no matches. What am I missing?

thanks
-- PMM


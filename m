Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SReh9-0002qJ-Bn
	for mharc-qemu-trivial@gnu.org; Tue, 08 May 2012 03:18:51 -0400
Received: from eggs.gnu.org ([208.118.235.92]:55181)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1SReh6-0002g9-09
	for qemu-trivial@nongnu.org; Tue, 08 May 2012 03:18:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1SReh1-00055w-5N
	for qemu-trivial@nongnu.org; Tue, 08 May 2012 03:18:47 -0400
Received: from mail-pb0-f45.google.com ([209.85.160.45]:34777)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1SRegu-0004w1-Jf; Tue, 08 May 2012 03:18:36 -0400
Received: by pbbro12 with SMTP id ro12so10397864pbb.4
	for <multiple recipients>; Tue, 08 May 2012 00:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=/NlZMf1ZbIZ9Tlk43RwfqZ7590lkQXCac7B9PF4c0OE=;
	b=Kd3cfD4CDcLh81DLH9eVD1QsIwAtnILkkfpEw/SXXwmJnDWFfrc8WLD6PX6GWo94SF
	0ESJU5ujDE9psnxxQ7f8etORIfREWrjZ5uj0yZMIO2f3fXMgGt/wJB3sa4ZEtVOPo2Vu
	c0EFIweJU8NtqpqaxfxWBUYTbtvujqxWioiictqfuA0OPw7FFpXgSJ+rROBtxdpqP3Cp
	3tNLnl6oZ0qAL0IL0YO29vdHT1eMx3QvQN1wa6L/33cscHf+drMuBMucDE548LF0TmVt
	xOPD+bTTcwfLPPfvJ8o7yoiNdtI13Wab6qAyJwTdJNr0DcqETom2jDb2xfYCBzkVtaWR
	VirA==
Received: by 10.68.236.34 with SMTP id ur2mr197439pbc.125.1336461513632;
	Tue, 08 May 2012 00:18:33 -0700 (PDT)
Received: from yakj.usersys.redhat.com (93-34-182-16.ip50.fastwebnet.it.
	[93.34.182.16])
	by mx.google.com with ESMTPS id qk5sm1448930pbc.45.2012.05.08.00.18.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 08 May 2012 00:18:32 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <4FA8C8C3.7080902@redhat.com>
Date: Tue, 08 May 2012 09:18:27 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120425 Thunderbird/12.0
MIME-Version: 1.0
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
References: <1336412858-9366-1-git-send-email-afaerber@suse.de>
In-Reply-To: <1336412858-9366-1-git-send-email-afaerber@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.160.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, agraf@suse.de
Subject: Re: [Qemu-trivial] [PATCH for-1.1] scripts/qemu-binfmt-conf.sh: Fix
	shell syntax
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
X-List-Received-Date: Tue, 08 May 2012 07:18:49 -0000

Il 07/05/2012 19:47, Andreas Färber ha scritto:
> The script is organized as a sequence of binfmt registrations, with a
> check whether the to be registered architecture matches the host.
> 
> Add a missing fi for the SuperH section.
> 
> Reported-by: Alexander Graf <agraf@suse.de>
> Signed-off-by: Andreas Färber <afaerber@suse.de>
> ---
>  scripts/qemu-binfmt-conf.sh |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/scripts/qemu-binfmt-conf.sh b/scripts/qemu-binfmt-conf.sh
> index 83a44d8..0da2618 100644
> --- a/scripts/qemu-binfmt-conf.sh
> +++ b/scripts/qemu-binfmt-conf.sh
> @@ -63,6 +63,7 @@ fi
>  if [ $cpu != "sh" ] ; then
>      echo    ':sh4:M::\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x2a\x00:\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff:/usr/local/bin/qemu-sh4:' > /proc/sys/fs/binfmt_misc/register
>      echo    ':sh4eb:M::\x7fELF\x01\x02\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x2a:\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff:/usr/local/bin/qemu-sh4eb:' > /proc/sys/fs/binfmt_misc/register
> +fi
>  if [ $cpu != "s390x" ] ; then
>      echo   ':s390x:M::\x7fELF\x02\x02\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x16:\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff:/usr/local/bin/qemu-s390x:' > /proc/sys/fs/binfmt_misc/register
>  fi

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

FWIW, in Fedora I changed qemu-binfmt-conf.sh to use systemd's embedded
ability to register binfmt_misc file formats.  I couldn't push it
upstream because half of it is in the spec file, but you're welcome to
lift it into OpenSUSE.

Paolo


Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SRoEL-0006Mv-Gx
	for mharc-qemu-trivial@gnu.org; Tue, 08 May 2012 13:29:45 -0400
Received: from eggs.gnu.org ([208.118.235.92]:53562)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1SRoED-0005v8-AD
	for qemu-trivial@nongnu.org; Tue, 08 May 2012 13:29:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1SRoEB-0001Oj-08
	for qemu-trivial@nongnu.org; Tue, 08 May 2012 13:29:36 -0400
Received: from mail-ob0-f173.google.com ([209.85.214.173]:36602)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1SRoEA-00011N-Rp
	for qemu-trivial@nongnu.org; Tue, 08 May 2012 13:29:34 -0400
Received: by mail-ob0-f173.google.com with SMTP id wd20so12116014obb.4
	for <qemu-trivial@nongnu.org>; Tue, 08 May 2012 10:29:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=e1v7p64lP4jmwUCRBS7Hwe0hPfZfEv4V1X2p9HQPIME=;
	b=UeWyWUyorijxqtLdaG+uxx+nRzs0PnycFYu+S9eugUcuj0DojHy0tC3f10nRcjnETu
	vNxCC4E8Kz6u3i5EPsWOHuh8pbSD0gKqPZNal2E9geJhEuIAEFEiZachtZeu3Xt1Z0lZ
	ddCPujSoSs5eZV5uxFhNQTSehTNRTxaoFH3sQ4sg23PphIBF83K5TywWdsWjkxLu0YPx
	pYRoRUobTNTTSHh0s5LWf7fHFjpgY/z/enmMSYovoecw8zCDQ+LdszGiUHtXfCfEe6x3
	nxa05NDkQ8avdFc6cVLCcufTGI3vuDlU4+SojLqtqCD2R/I/AOH9CIy3b/Y3/rxyU/iI
	0QYA==
Received: by 10.182.77.167 with SMTP id t7mr7473015obw.10.1336498174218;
	Tue, 08 May 2012 10:29:34 -0700 (PDT)
Received: from [70.123.136.102] (cpe-70-123-136-102.austin.res.rr.com.
	[70.123.136.102]) by mx.google.com with ESMTPS id
	bd10sm22420576obb.15.2012.05.08.10.29.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 08 May 2012 10:29:33 -0700 (PDT)
Message-ID: <4FA957FB.4080002@codemonkey.ws>
Date: Tue, 08 May 2012 12:29:31 -0500
From: Anthony Liguori <anthony@codemonkey.ws>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
References: <1336412858-9366-1-git-send-email-afaerber@suse.de>
In-Reply-To: <1336412858-9366-1-git-send-email-afaerber@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Gm-Message-State: ALoCoQmbDGxrFAheyd31tIjFtD3ibWZR7ZWiEIlJeY82MvFjKuTdPjjXIMiAwPht/GohVSW0EM7L
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, agraf@suse.de
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-1.1]
 scripts/qemu-binfmt-conf.sh: Fix shell syntax
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
X-List-Received-Date: Tue, 08 May 2012 17:29:44 -0000

On 05/07/2012 12:47 PM, Andreas Färber wrote:
> The script is organized as a sequence of binfmt registrations, with a
> check whether the to be registered architecture matches the host.
>
> Add a missing fi for the SuperH section.
>
> Reported-by: Alexander Graf<agraf@suse.de>
> Signed-off-by: Andreas Färber<afaerber@suse.de>

Applied.  Thanks.

Regards,

Anthony Liguori

> ---
>   scripts/qemu-binfmt-conf.sh |    1 +
>   1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/scripts/qemu-binfmt-conf.sh b/scripts/qemu-binfmt-conf.sh
> index 83a44d8..0da2618 100644
> --- a/scripts/qemu-binfmt-conf.sh
> +++ b/scripts/qemu-binfmt-conf.sh
> @@ -63,6 +63,7 @@ fi
>   if [ $cpu != "sh" ] ; then
>       echo    ':sh4:M::\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x2a\x00:\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff:/usr/local/bin/qemu-sh4:'>  /proc/sys/fs/binfmt_misc/register
>       echo    ':sh4eb:M::\x7fELF\x01\x02\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x2a:\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff:/usr/local/bin/qemu-sh4eb:'>  /proc/sys/fs/binfmt_misc/register
> +fi
>   if [ $cpu != "s390x" ] ; then
>       echo   ':s390x:M::\x7fELF\x02\x02\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x16:\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff:/usr/local/bin/qemu-s390x:'>  /proc/sys/fs/binfmt_misc/register
>   fi



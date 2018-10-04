Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1g86ps-0005F6-JW
	for mharc-qemu-trivial@gnu.org; Thu, 04 Oct 2018 12:50:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58458)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1g86pp-0005CM-By
	for qemu-trivial@nongnu.org; Thu, 04 Oct 2018 12:50:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1g86pl-00034t-4a
	for qemu-trivial@nongnu.org; Thu, 04 Oct 2018 12:50:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38288)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1g86pQ-0002TR-Gb; Thu, 04 Oct 2018 12:50:20 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A4DEFC04BD5C;
	Thu,  4 Oct 2018 16:50:15 +0000 (UTC)
Received: from [10.10.126.73] (ovpn-126-73.rdu2.redhat.com [10.10.126.73])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3A12BBA72;
	Thu,  4 Oct 2018 16:50:09 +0000 (UTC)
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	qemu-block@nongnu.org, qemu-trivial@nongnu.org,
	Riku Voipio <riku.voipio@iki.fi>, Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>
References: <20181004161852.11673-1-crosa@redhat.com>
	<20181004161852.11673-10-crosa@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <18373d58-eeac-4acd-b112-41c8c47cd605@redhat.com>
Date: Thu, 4 Oct 2018 11:50:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181004161852.11673-10-crosa@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 04 Oct 2018 16:50:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 09/10] scripts/qemu.py: use
 a more consistent docstring style
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
X-List-Received-Date: Thu, 04 Oct 2018 16:50:46 -0000

On 10/4/18 11:18 AM, Cleber Rosa wrote:
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   dtc             |  2 +-
>   scripts/qemu.py | 65 +++++++++++++++++++++++++++++++------------------
>   2 files changed, 42 insertions(+), 25 deletions(-)
> 
> diff --git a/dtc b/dtc
> index 88f18909db..e54388015a 160000
> --- a/dtc
> +++ b/dtc
> @@ -1 +1 @@
> -Subproject commit 88f18909db731a627456f26d779445f84e449536
> +Subproject commit e54388015af1fb4bf04d0bca99caba1074d9cc42

The submodule change was probably unintended.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bhAil-00023M-N5
	for mharc-qemu-trivial@gnu.org; Tue, 06 Sep 2016 03:23:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34542)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bhAif-0001xY-KG
	for qemu-trivial@nongnu.org; Tue, 06 Sep 2016 03:23:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bhAid-00066t-M6
	for qemu-trivial@nongnu.org; Tue, 06 Sep 2016 03:22:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59380)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1bhAiU-00066F-68; Tue, 06 Sep 2016 03:22:46 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CF27385365;
	Tue,  6 Sep 2016 07:22:45 +0000 (UTC)
Received: from [10.36.112.34] (ovpn-112-34.ams2.redhat.com [10.36.112.34])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u867Mgtl024528
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 6 Sep 2016 03:22:44 -0400
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <1473106301-23102-1-git-send-email-thuth@redhat.com>
Cc: qemu-trivial@nongnu.org
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <9b4f5a80-afef-2825-d530-90e02bec0863@redhat.com>
Date: Tue, 6 Sep 2016 09:22:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1473106301-23102-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 06 Sep 2016 07:22:45 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] MAINTAINERS: Fix wildcard for scsi
 headers
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
X-List-Received-Date: Tue, 06 Sep 2016 07:23:02 -0000



On 05/09/2016 22:11, Thomas Huth wrote:
> get_maintainer.pl currently thinks that the scsi headers are
> currrently unmaintained. So let's fix the corresponding wildcard
> expression.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d1bacb2..60af338 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -842,7 +842,7 @@ T: git git://github.com/jasowang/qemu.git net
>  SCSI
>  M: Paolo Bonzini <pbonzini@redhat.com>
>  S: Supported
> -F: include/hw/scsi*
> +F: include/hw/scsi/*
>  F: hw/scsi/*
>  T: git git://github.com/bonzini/qemu.git scsi-next
>  
> 

Acked-by: Paolo Bonzini <pbonzini@redhat.com>


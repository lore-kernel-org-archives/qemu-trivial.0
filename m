Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dIGD7-0004TZ-MH
	for mharc-qemu-trivial@gnu.org; Tue, 06 Jun 2017 11:15:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47375)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dIGD5-0004SG-DL
	for qemu-trivial@nongnu.org; Tue, 06 Jun 2017 11:15:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dIGD4-0002uO-Je
	for qemu-trivial@nongnu.org; Tue, 06 Jun 2017 11:15:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42684)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dIGD0-0002qh-A9; Tue, 06 Jun 2017 11:15:50 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8206B811A7;
	Tue,  6 Jun 2017 15:15:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 8206B811A7
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=thuth@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 8206B811A7
Received: from [10.36.116.238] (ovpn-116-238.ams2.redhat.com [10.36.116.238])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C2A5217DCA;
	Tue,  6 Jun 2017 15:15:45 +0000 (UTC)
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20170606150016.17143-1-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <20fe6f32-f5bb-9ebf-f0d6-8e48e2d497ba@redhat.com>
Date: Tue, 6 Jun 2017 17:15:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <20170606150016.17143-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 06 Jun 2017 15:15:48 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-doc: do not refer to
 years-old version numbers
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
X-List-Received-Date: Tue, 06 Jun 2017 15:15:56 -0000

On 06.06.2017 17:00, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  qemu-doc.texi | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/qemu-doc.texi b/qemu-doc.texi
> index 8e5c4a951f..51046ef9d1 100644
> --- a/qemu-doc.texi
> +++ b/qemu-doc.texi
> @@ -386,11 +386,9 @@ CPU registers by prefixing them with @emph{$}.
>  @node disk_images
>  @section Disk Images
>  
> -Since version 0.6.1, QEMU supports many disk image formats, including
> -growable disk images (their size increase as non empty sectors are
> -written), compressed and encrypted disk images. Version 0.8.3 added
> -the new qcow2 disk image format which is essential to support VM
> -snapshots.
> +QEMU supports many disk image formats, including growable disk images
> +(their size increase as non empty sectors are written), compressed and
> +encrypted disk images.
>  
>  @menu
>  * disk_images_quickstart::    Quick start for disk image creation
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


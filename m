Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XoWJY-0008DX-Au
	for mharc-qemu-trivial@gnu.org; Wed, 12 Nov 2014 06:42:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57000)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1XoWJN-0008DP-Ce
	for qemu-trivial@nongnu.org; Wed, 12 Nov 2014 06:42:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1XoWJC-0002I7-DI
	for qemu-trivial@nongnu.org; Wed, 12 Nov 2014 06:42:09 -0500
Received: from mail-wg0-x233.google.com ([2a00:1450:400c:c00::233]:64803)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1XoWJC-0002I0-64; Wed, 12 Nov 2014 06:41:58 -0500
Received: by mail-wg0-f51.google.com with SMTP id l18so13729530wgh.24
	for <multiple recipients>; Wed, 12 Nov 2014 03:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:newsgroups:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=pSoISvnNkI6Nll11RCqsTw01L6Dz2TazM0jvTAb8AQQ=;
	b=iwYZOA+UHS/bPf0Fve11/I6jhuLJe0nXY6gZZvyPl3FKrTnudWwmfqkhi2zE5dl/3n
	e3VmPXhIKUWCpc/yIabDKeIyD3DTi+16uYTEug9kLAyO3yy1kN/E2p5+FYqRFvz2iB96
	r7fnmO9o7JYnJIMCcPFl+QJZjNBCPMoqWAcU7AHyBvYphZRSOGr6IfCbOQYDt0eRdlgt
	etxYCV9hi5UB5SMGxYfXJZaiegahpzoFiqf6NKhxbVJ4XtGJMVkvjRtq/B8GAcOzKJuy
	+cgOCxsNL18z+/zI1CiApuJ6+hPol4d41Ks2tF02iD2pN8sJrf6IuUkEeqrz0NP61DPQ
	gF7w==
X-Received: by 10.180.11.65 with SMTP id o1mr26005942wib.22.1415792517497;
	Wed, 12 Nov 2014 03:41:57 -0800 (PST)
Received: from [192.168.10.165] (net-37-117-142-149.cust.vodafonedsl.it.
	[37.117.142.149])
	by mx.google.com with ESMTPSA id ht9sm21313620wib.8.2014.11.12.03.41.55
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Nov 2014 03:41:56 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <54634781.5040606@redhat.com>
Date: Wed, 12 Nov 2014 12:41:53 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
Newsgroups: gmane.comp.emulators.qemu
To: Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org
References: <1415791795-6779-1-git-send-email-famz@redhat.com>
In-Reply-To: <1415791795-6779-1-git-send-email-famz@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::233
Cc: qemu-trivial@nongnu.org, mjt@tls.msk.ru,
	Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] virtio-scsi: Fix comment for
	VirtIOSCSIReq
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
X-List-Received-Date: Wed, 12 Nov 2014 11:42:18 -0000



On 12/11/2014 12:29, Fam Zheng wrote:
> The cdb is not zeroed by virtio_scsi_init_req, so fix the misleading
> comment.
> 
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Fam Zheng <famz@redhat.com>
> ---
>  include/hw/virtio/virtio-scsi.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/include/hw/virtio/virtio-scsi.h b/include/hw/virtio/virtio-scsi.h
> index 9e1a49c..bf17cc9 100644
> --- a/include/hw/virtio/virtio-scsi.h
> +++ b/include/hw/virtio/virtio-scsi.h
> @@ -209,7 +209,8 @@ typedef struct VirtIOSCSIReq {
>      /* Note:
>       * - fields before elem are initialized by virtio_scsi_init_req;
>       * - elem is uninitialized at the time of allocation.
> -     * - fields after elem are zeroed by virtio_scsi_init_req.
> +     * - fields after elem (except the ending cdb[]) are zeroed by
> +     *   virtio_scsi_init_req.
>       * */
>  
>      VirtQueueElement elem;
> 

Applied, thanks.

Paolo


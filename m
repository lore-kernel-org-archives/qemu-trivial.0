Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZgghA-00089o-DH
	for mharc-qemu-trivial@gnu.org; Mon, 28 Sep 2015 18:14:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35522)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZgWGt-0006HN-J5
	for qemu-trivial@nongnu.org; Mon, 28 Sep 2015 07:07:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZgWGs-0003XL-Nv
	for qemu-trivial@nongnu.org; Mon, 28 Sep 2015 07:07:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36792)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1ZgWGk-0003V2-DU; Mon, 28 Sep 2015 07:06:54 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id DB014A8A;
	Mon, 28 Sep 2015 11:06:53 +0000 (UTC)
Received: from [10.36.7.147] (vpn1-7-147.ams2.redhat.com [10.36.7.147])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t8SB6oId013959
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 28 Sep 2015 07:06:51 -0400
To: Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org
References: <1443284532-8634-1-git-send-email-laurent@vivier.eu>
	<1443284532-8634-11-git-send-email-laurent@vivier.eu>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <56091F4A.9070403@redhat.com>
Date: Mon, 28 Sep 2015 13:06:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1443284532-8634-11-git-send-email-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
	Alexander Graf <agraf@suse.de>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 10/10][TRIVIAL] openpic: add
	to misc category
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
X-List-Received-Date: Mon, 28 Sep 2015 11:07:04 -0000

On 26/09/15 18:22, Laurent Vivier wrote:
> openpic is a programmable interrupt controller, so
> add it to the misc category.
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  hw/intc/openpic.c     | 1 +
>  hw/intc/openpic_kvm.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/hw/intc/openpic.c b/hw/intc/openpic.c
> index 14ab0e3..bfcf155 100644
> --- a/hw/intc/openpic.c
> +++ b/hw/intc/openpic.c
> @@ -1643,6 +1643,7 @@ static void openpic_class_init(ObjectClass *oc, void *data)
>      dc->props = openpic_properties;
>      dc->reset = openpic_reset;
>      dc->vmsd = &vmstate_openpic;
> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>  }
>  
>  static const TypeInfo openpic_info = {
> diff --git a/hw/intc/openpic_kvm.c b/hw/intc/openpic_kvm.c
> index f7cac58..649f476 100644
> --- a/hw/intc/openpic_kvm.c
> +++ b/hw/intc/openpic_kvm.c
> @@ -275,6 +275,7 @@ static void kvm_openpic_class_init(ObjectClass *oc, void *data)
>      dc->realize = kvm_openpic_realize;
>      dc->props = kvm_openpic_properties;
>      dc->reset = kvm_openpic_reset;
> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>  }

Reviewed-by: Thomas Huth <thuth@redhat.com>




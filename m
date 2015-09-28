Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zggb3-000686-RQ
	for mharc-qemu-trivial@gnu.org; Mon, 28 Sep 2015 18:08:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34951)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZgWFU-00068C-Hy
	for qemu-trivial@nongnu.org; Mon, 28 Sep 2015 07:05:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZgWFT-0002m0-OW
	for qemu-trivial@nongnu.org; Mon, 28 Sep 2015 07:05:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36458)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1ZgWF9-0002ab-Lz; Mon, 28 Sep 2015 07:05:15 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id B76E53B3C2;
	Mon, 28 Sep 2015 11:05:14 +0000 (UTC)
Received: from [10.36.7.147] (vpn1-7-147.ams2.redhat.com [10.36.7.147])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t8SB5A8I004656
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 28 Sep 2015 07:05:12 -0400
To: Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org
References: <1443284532-8634-1-git-send-email-laurent@vivier.eu>
	<1443284532-8634-9-git-send-email-laurent@vivier.eu>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <56091EE5.3080707@redhat.com>
Date: Mon, 28 Sep 2015 13:05:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1443284532-8634-9-git-send-email-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
	Alexander Graf <agraf@suse.de>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 08/10][TRIVIAL] macio: add
	to bridge category
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
X-List-Received-Date: Mon, 28 Sep 2015 11:05:38 -0000

On 26/09/15 18:22, Laurent Vivier wrote:
> macio is a bridge between the PCI bus and the Mac nvram,
> IDE controller and PIC, so add it to the bridge category.
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  hw/misc/macio/macio.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/misc/macio/macio.c b/hw/misc/macio/macio.c
> index e3c0242..c0989a0 100644
> --- a/hw/misc/macio/macio.c
> +++ b/hw/misc/macio/macio.c
> @@ -393,6 +393,7 @@ static void macio_class_init(ObjectClass *klass, void *data)
>      k->vendor_id = PCI_VENDOR_ID_APPLE;
>      k->class_id = PCI_CLASS_OTHERS << 8;
>      dc->props = macio_properties;
> +    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
>  }

Reviewed-by: Thomas Huth <thuth@redhat.com>




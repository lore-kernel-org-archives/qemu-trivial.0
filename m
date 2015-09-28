Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZggAj-0003bH-V7
	for mharc-qemu-trivial@gnu.org; Mon, 28 Sep 2015 17:41:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57947)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZgVza-0003Ko-OY
	for qemu-trivial@nongnu.org; Mon, 28 Sep 2015 06:49:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZgVzZ-0003F8-Vq
	for qemu-trivial@nongnu.org; Mon, 28 Sep 2015 06:49:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44301)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1ZgVzQ-00039h-WB; Mon, 28 Sep 2015 06:49:01 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 9ADDD2FAA67;
	Mon, 28 Sep 2015 10:49:00 +0000 (UTC)
Received: from [10.36.7.147] (vpn1-7-147.ams2.redhat.com [10.36.7.147])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t8SAmvZZ025574
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 28 Sep 2015 06:48:58 -0400
To: Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org
References: <1443284532-8634-1-git-send-email-laurent@vivier.eu>
	<1443284532-8634-7-git-send-email-laurent@vivier.eu>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <56091B18.7040004@redhat.com>
Date: Mon, 28 Sep 2015 12:48:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1443284532-8634-7-git-send-email-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
	Alexander Graf <agraf@suse.de>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 06/10][TRIVIAL] macio-ide:
 add to storage category
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
X-List-Received-Date: Mon, 28 Sep 2015 10:49:11 -0000

On 26/09/15 18:22, Laurent Vivier wrote:
> macio-ide is an IDE controller, so add it
> to the storage category.
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  hw/ide/macio.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/ide/macio.c b/hw/ide/macio.c
> index 66ac2ba..893c9b9 100644
> --- a/hw/ide/macio.c
> +++ b/hw/ide/macio.c
> @@ -590,6 +590,7 @@ static void macio_ide_class_init(ObjectClass *oc, void *data)
>      dc->realize = macio_ide_realizefn;
>      dc->reset = macio_ide_reset;
>      dc->vmsd = &vmstate_pmac;
> +    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
>  }

Reviewed-by: Thomas Huth <thuth@redhat.com>




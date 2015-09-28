Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zgg8Y-0000Ws-Fz
	for mharc-qemu-trivial@gnu.org; Mon, 28 Sep 2015 17:39:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57333)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZgVxy-0002d8-1z
	for qemu-trivial@nongnu.org; Mon, 28 Sep 2015 06:47:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZgVxx-0002P2-64
	for qemu-trivial@nongnu.org; Mon, 28 Sep 2015 06:47:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33768)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1ZgVxn-0002L1-T8; Mon, 28 Sep 2015 06:47:20 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 86B833B3C2;
	Mon, 28 Sep 2015 10:47:19 +0000 (UTC)
Received: from [10.36.7.147] (vpn1-7-147.ams2.redhat.com [10.36.7.147])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t8SAlFto025240
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 28 Sep 2015 06:47:16 -0400
To: Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org
References: <1443284532-8634-1-git-send-email-laurent@vivier.eu>
	<1443284532-8634-4-git-send-email-laurent@vivier.eu>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <56091AB3.4010207@redhat.com>
Date: Mon, 28 Sep 2015 12:47:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1443284532-8634-4-git-send-email-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
	Alexander Graf <agraf@suse.de>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 03/10][TRIVIAL] escc: add to
	input category
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
X-List-Received-Date: Mon, 28 Sep 2015 10:47:35 -0000

On 26/09/15 18:22, Laurent Vivier wrote:
> ESCC is a serial port controller, so add it
> to the input category.
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  hw/char/escc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/char/escc.c b/hw/char/escc.c
> index ba653ef..9816154 100644
> --- a/hw/char/escc.c
> +++ b/hw/char/escc.c
> @@ -1035,6 +1035,7 @@ static void escc_class_init(ObjectClass *klass, void *data)
>      dc->reset = escc_reset;
>      dc->vmsd = &vmstate_escc;
>      dc->props = escc_properties;
> +    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
>  }

Reviewed-by: Thomas Huth <thuth@redhat.com>




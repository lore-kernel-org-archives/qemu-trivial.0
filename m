Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zgg8T-0000P7-T5
	for mharc-qemu-trivial@gnu.org; Mon, 28 Sep 2015 17:39:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56614)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZgVve-0002Pl-1p
	for qemu-trivial@nongnu.org; Mon, 28 Sep 2015 06:45:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZgVva-0000gy-7f
	for qemu-trivial@nongnu.org; Mon, 28 Sep 2015 06:45:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44965)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1ZgVvT-0000al-0I; Mon, 28 Sep 2015 06:44:55 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id E3BC58EA30;
	Mon, 28 Sep 2015 10:44:53 +0000 (UTC)
Received: from [10.36.7.147] (vpn1-7-147.ams2.redhat.com [10.36.7.147])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t8SAioX8003475
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 28 Sep 2015 06:44:51 -0400
To: Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org
References: <1443284532-8634-1-git-send-email-laurent@vivier.eu>
	<1443284532-8634-2-git-send-email-laurent@vivier.eu>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <56091A21.2030304@redhat.com>
Date: Mon, 28 Sep 2015 12:44:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1443284532-8634-2-git-send-email-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
	Alexander Graf <agraf@suse.de>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 01/10][TRIVIAL] adb: add to
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
X-List-Received-Date: Mon, 28 Sep 2015 10:45:11 -0000

On 26/09/15 18:22, Laurent Vivier wrote:
> The Apple Desktop Bus is used to connect a keyboard and a mouse,
> so add it to the input category.
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  hw/input/adb.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/hw/input/adb.c b/hw/input/adb.c
> index a18eea2..09eead9 100644
> --- a/hw/input/adb.c
> +++ b/hw/input/adb.c
> @@ -362,6 +362,7 @@ static void adb_kbd_class_init(ObjectClass *oc, void *data)
>  
>      akc->parent_realize = dc->realize;
>      dc->realize = adb_kbd_realizefn;
> +    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
>  
>      adc->devreq = adb_kbd_request;
>      dc->reset = adb_kbd_reset;
> @@ -566,6 +567,7 @@ static void adb_mouse_class_init(ObjectClass *oc, void *data)
>  
>      amc->parent_realize = dc->realize;
>      dc->realize = adb_mouse_realizefn;
> +    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
>  
>      adc->devreq = adb_mouse_request;
>      dc->reset = adb_mouse_reset;

Reviewed-by: Thomas Huth <thuth@redhat.com>




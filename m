Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cVvkZ-00088K-CY
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jan 2017 02:42:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38964)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cVvkX-00086h-2w
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 02:42:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cVvkW-0004Un-DW
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 02:42:41 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:57830)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1cVvkS-0004T3-8D; Tue, 24 Jan 2017 02:42:36 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E9A2A420E2;
	Tue, 24 Jan 2017 10:42:27 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with ESMTP id 745BC548;
	Tue, 24 Jan 2017 10:42:27 +0300 (MSK)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <1484927639-3841-1-git-send-email-thuth@redhat.com>
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <0c562336-31a8-5347-1123-810543563fd5@msgid.tls.msk.ru>
Date: Tue, 24 Jan 2017 10:42:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <1484927639-3841-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] hw/isa/isa-bus: Set category of the
 "isabus-bridge" device
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
X-List-Received-Date: Tue, 24 Jan 2017 07:42:42 -0000

20.01.2017 18:53, Thomas Huth wrote:
> It has "bridge" in its name, so it should be in the category
> DEVICE_CATEGORY_BRIDGE.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/isa/isa-bus.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
> index 9d07b11..0ffbc8d 100644
> --- a/hw/isa/isa-bus.c
> +++ b/hw/isa/isa-bus.c
> @@ -219,6 +219,7 @@ static void isabus_bridge_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
>  
> +    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
>      dc->fw_name = "isa";
>  }

Does it have any effect on the guest?
ISA is an old thing...

Thanks,

/mjt


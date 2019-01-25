Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gn7ai-0006tr-M1
	for mharc-qemu-trivial@gnu.org; Fri, 25 Jan 2019 14:56:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42562)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gn7ah-0006e5-0j
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2019 14:56:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gn7R5-0007dD-RB
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2019 14:46:45 -0500
Received: from mx1.redhat.com ([209.132.183.28]:7893)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1gn7Qx-0007XH-Ms; Fri, 25 Jan 2019 14:46:36 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7C37ACCB9A;
	Fri, 25 Jan 2019 19:46:26 +0000 (UTC)
Received: from redhat.com (ovpn-122-46.rdu2.redhat.com [10.10.122.46])
	by smtp.corp.redhat.com (Postfix) with SMTP id 818A11048125;
	Fri, 25 Jan 2019 19:46:25 +0000 (UTC)
Date: Fri, 25 Jan 2019 14:46:24 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: kumar sourav <sourav.jb1988@gmail.com>
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, qemu-devel@nongnu.org,
	thuth@redhat.com
Message-ID: <20190125144613-mutt-send-email-mst@kernel.org>
References: <20190125151440.13794-1-sourav.jb1988@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190125151440.13794-1-sourav.jb1988@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 25 Jan 2019 19:46:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] hw: input: set category of the i8042
 device
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
X-List-Received-Date: Fri, 25 Jan 2019 19:56:40 -0000

On Fri, Jan 25, 2019 at 08:44:40PM +0530, kumar sourav wrote:
> Sets the category of i8042 device as DEVICE_CATEGORY_INPUT
> Devices should be assigned to one of DEVICE_CATEGORY_XXXX.
> 
> Signed-off-by: kumar sourav <sourav.jb1988@gmail.com>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

who's merging this? Paolo?

> ---
>  hw/input/pckbd.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
> index 3e66713b47..72e7d5f6cc 100644
> --- a/hw/input/pckbd.c
> +++ b/hw/input/pckbd.c
> @@ -574,6 +574,7 @@ static void i8042_class_initfn(ObjectClass *klass, void *data)
>  
>      dc->realize = i8042_realizefn;
>      dc->vmsd = &vmstate_kbd_isa;
> +    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
>  }
>  
>  static const TypeInfo i8042_info = {
> -- 
> 2.17.1


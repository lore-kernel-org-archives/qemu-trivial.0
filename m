Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wn4Th-0003dj-HW
	for mharc-qemu-trivial@gnu.org; Wed, 21 May 2014 07:14:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60145)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1Wn4TZ-0003RX-Am
	for qemu-trivial@nongnu.org; Wed, 21 May 2014 07:14:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1Wn4TT-0004Mq-3H
	for qemu-trivial@nongnu.org; Wed, 21 May 2014 07:14:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44395)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1Wn4TG-0004H4-8w; Wed, 21 May 2014 07:14:06 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s4LBE41D017263
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Wed, 21 May 2014 07:14:04 -0400
Received: from yakj.usersys.redhat.com (ovpn-112-31.ams2.redhat.com
	[10.36.112.31])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s4LBE1q9007189; Wed, 21 May 2014 07:14:03 -0400
Message-ID: <537C8A79.1010103@redhat.com>
Date: Wed, 21 May 2014 13:14:01 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Saravanakumar <saravanakumar.punith@gmail.com>, qemu-devel@nongnu.org
References: <1400668900-22972-1-git-send-email-saravanakumar.punith@gmail.com>
In-Reply-To: <1400668900-22972-1-git-send-email-saravanakumar.punith@gmail.com>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] jazz_led: Add missing break in switch
	case
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
X-List-Received-Date: Wed, 21 May 2014 11:14:31 -0000

Il 21/05/2014 12:41, Saravanakumar ha scritto:
> Signed-off-by: Saravanakumar <saravanakumar.punith@gmail.com>
> ---
>  hw/display/jazz_led.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/hw/display/jazz_led.c b/hw/display/jazz_led.c
> index e9bb005..12b1707 100644
> --- a/hw/display/jazz_led.c
> +++ b/hw/display/jazz_led.c
> @@ -173,6 +173,7 @@ static void jazz_led_update_display(void *opaque)
>              case 16:
>                  color_segment = rgb_to_pixel16(0xaa, 0xaa, 0xaa);
>                  color_led = rgb_to_pixel16(0x00, 0xff, 0x00);
> +                break;
>              case 24:
>                  color_segment = rgb_to_pixel24(0xaa, 0xaa, 0xaa);
>                  color_led = rgb_to_pixel24(0x00, 0xff, 0x00);
>

Reviewed-by: Paolo Bonizni <pbonzini@redhat.com>


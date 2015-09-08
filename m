Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZZIRC-0006gv-59
	for mharc-qemu-trivial@gnu.org; Tue, 08 Sep 2015 08:55:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34548)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ZZIR9-0006fE-Fp
	for qemu-trivial@nongnu.org; Tue, 08 Sep 2015 08:55:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ZZIR8-0006fF-5z
	for qemu-trivial@nongnu.org; Tue, 08 Sep 2015 08:55:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34511)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1ZZIR3-0006cU-Lj; Tue, 08 Sep 2015 08:55:41 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 4F791C0AE692;
	Tue,  8 Sep 2015 12:55:41 +0000 (UTC)
Received: from [10.36.5.129] (vpn1-5-129.ams2.redhat.com [10.36.5.129])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t88CtdFf032040; Tue, 8 Sep 2015 08:55:40 -0400
To: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org
References: <1440703987-29012-1-git-send-email-lvivier@redhat.com>
	<1440703987-29012-9-git-send-email-lvivier@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <55EEDACB.2040009@redhat.com>
Date: Tue, 8 Sep 2015 14:55:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <1440703987-29012-9-git-send-email-lvivier@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3 8/9] bt: remove muldiv64()
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
X-List-Received-Date: Tue, 08 Sep 2015 12:55:48 -0000

ping ?

On 27/08/2015 21:33, Laurent Vivier wrote:
> Originally, timers were ticks based, and it made sense to
> add ticks to current time to know when to trigger an alarm.
> 
> But since commit:
> 
> 7447545 change all other clock references to use nanosecond resolution accessors
> 
> All timers use nanoseconds and we need to convert ticks to nanoseconds.
> 
> As get_ticks_per_sec() is 10^9,
> 
>     a = muldiv64(b, get_ticks_per_sec(), 100);
>     y = muldiv64(x, get_ticks_per_sec(), 1000000);
> 
> can be converted to
> 
>     a = b * 10000000;
>     y = x * 1000;
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  hw/bt/hci.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/bt/hci.c b/hw/bt/hci.c
> index 7ea3dc6..585ee2e 100644
> --- a/hw/bt/hci.c
> +++ b/hw/bt/hci.c
> @@ -595,7 +595,7 @@ static void bt_hci_inquiry_result(struct bt_hci_s *hci,
>  static void bt_hci_mod_timer_1280ms(QEMUTimer *timer, int period)
>  {
>      timer_mod(timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> -                   muldiv64(period << 7, get_ticks_per_sec(), 100));
> +                     (uint64_t)(period << 7) * 10000000);
>  }
>  
>  static void bt_hci_inquiry_start(struct bt_hci_s *hci, int length)
> @@ -1099,7 +1099,7 @@ static int bt_hci_mode_change(struct bt_hci_s *hci, uint16_t handle,
>      bt_hci_event_status(hci, HCI_SUCCESS);
>  
>      timer_mod(link->acl_mode_timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
> -                   muldiv64(interval * 625, get_ticks_per_sec(), 1000000));
> +                                    ((uint64_t)interval * 625) * 1000);
>      bt_hci_lmp_mode_change_master(hci, link->link, mode, interval);
>  
>      return 0;
> 


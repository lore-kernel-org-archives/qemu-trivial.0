Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Y8Czf-00051S-Vh
	for mharc-qemu-trivial@gnu.org; Mon, 05 Jan 2015 14:07:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33218)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1Y8As7-0006Pr-4B
	for qemu-trivial@nongnu.org; Mon, 05 Jan 2015 11:51:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1Y8As6-0002VY-4T
	for qemu-trivial@nongnu.org; Mon, 05 Jan 2015 11:51:15 -0500
Received: from mx1.redhat.com ([209.132.183.28]:39146)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>)
	id 1Y8Ary-0002Su-Mp; Mon, 05 Jan 2015 11:51:06 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t05Gp3HM002888
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 5 Jan 2015 11:51:04 -0500
Received: from scv.usersys.redhat.com ([10.18.17.38])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t05Gp2vF002699; Mon, 5 Jan 2015 11:51:02 -0500
Message-ID: <54AAC0F5.2030807@redhat.com>
Date: Mon, 05 Jan 2015 11:51:01 -0500
From: John Snow <jsnow@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <1420292499-8596-1-git-send-email-sw@weilnetz.de>
	<1420292499-8596-4-git-send-email-sw@weilnetz.de>
In-Reply-To: <1420292499-8596-4-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Mon, 05 Jan 2015 14:07:10 -0500
Cc: Igor Mammedov <imammedo@redhat.com>, QEMU Developer <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 3/3] misc: Fix new typos in
	comments
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
X-List-Received-Date: Mon, 05 Jan 2015 16:51:16 -0000



On 01/03/2015 08:41 AM, Stefan Weil wrote:
> recieve -> receive
> suprise -> surprise
>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: John Snow <jsnow@redhat.com>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>   include/hw/hotplug.h |    2 +-
>   tests/ahci-test.c    |    2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/include/hw/hotplug.h b/include/hw/hotplug.h
> index 050d2f0..2db025d 100644
> --- a/include/hw/hotplug.h
> +++ b/include/hw/hotplug.h
> @@ -52,7 +52,7 @@ typedef void (*hotplug_fn)(HotplugHandler *plug_handler,
>    *                  require asynchronous unplug handling.
>    * @unplug: unplug callback.
>    *          Used for device removal with devices that implement
> - *          asynchronous and synchronous (suprise) removal.
> + *          asynchronous and synchronous (surprise) removal.
>    */
>   typedef struct HotplugHandlerClass {
>       /* <private> */
> diff --git a/tests/ahci-test.c b/tests/ahci-test.c
> index e77fa3a..b1a59f2 100644
> --- a/tests/ahci-test.c
> +++ b/tests/ahci-test.c
> @@ -1289,7 +1289,7 @@ static void ahci_test_identify(QPCIDevice *ahci, void *hba_base)
>       PX_WREG(i, AHCI_PX_IS, reg);
>       g_assert_cmphex(PX_RREG(i, AHCI_PX_IS), ==, 0);
>
> -    /* Wipe the FIS-Recieve Buffer */
> +    /* Wipe the FIS-Receive Buffer */
>       fb = PX_RREG(i, AHCI_PX_FB);
>       g_assert_cmphex(fb, !=, 0);
>       qmemset(fb, 0x00, 0x100);
>

I seem to have missed a certain elementary school rhyme.

Reviewed-by: John Snow <jsnow@redhat.com>


Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL9Xv-0005eH-6x
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 07:04:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45928)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YL9Xs-0005cB-S6
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 07:04:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YL9Xr-0005wR-Nm
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 07:04:00 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45966)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YL9Xm-0005uS-DY; Tue, 10 Feb 2015 07:03:54 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t1AC3oit000707
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 10 Feb 2015 07:03:51 -0500
Received: from blackfin.pond.sub.org (ovpn-116-87.ams2.redhat.com
	[10.36.116.87])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t1AC3mob000959
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 10 Feb 2015 07:03:50 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id E51AC3040D0A; Tue, 10 Feb 2015 13:03:47 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-trivial@nongnu.org
References: <1421846317-7088-1-git-send-email-armbru@redhat.com>
	<CAEgOgz73n5P+LH=pa4+qqxNwoX45BJbaKbQK4VSZGkB8eYAthw@mail.gmail.com>
Date: Tue, 10 Feb 2015 13:03:47 +0100
In-Reply-To: <CAEgOgz73n5P+LH=pa4+qqxNwoX45BJbaKbQK4VSZGkB8eYAthw@mail.gmail.com>
	(Peter Crosthwaite's message of "Wed, 4 Feb 2015 08:47:00 -0800")
Message-ID: <87pp9ij7mk.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] xilinx_ethlite: Clean up
	after commit 2f991ad
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
X-List-Received-Date: Tue, 10 Feb 2015 12:04:01 -0000

Since maintainers haven't picked it up: could this go in via -trivial?

Peter Crosthwaite <peter.crosthwaite@xilinx.com> writes:

> On Wed, Jan 21, 2015 at 5:18 AM, Markus Armbruster <armbru@redhat.com> wrote:
>> The "fall through" added by the commit is clearly intentional.  Mark
>> it so.  Hushes up Coverity.
>>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>
> Reviewed-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
>
>> ---
>>  hw/net/xilinx_ethlite.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
>> index 9536f64..ad6b553 100644
>> --- a/hw/net/xilinx_ethlite.c
>> +++ b/hw/net/xilinx_ethlite.c
>> @@ -146,6 +146,7 @@ eth_write(void *opaque, hwaddr addr,
>>              if (!(value & CTRL_S)) {
>>                  qemu_flush_queued_packets(qemu_get_queue(s->nic));
>>              }
>> +            /* fall through */
>>          case R_TX_LEN0:
>>          case R_TX_LEN1:
>>          case R_TX_GIE0:
>> --
>> 1.9.3
>>
>>


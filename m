Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WVLgY-0005Oa-1g
	for mharc-qemu-trivial@gnu.org; Wed, 02 Apr 2014 09:58:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42114)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.com>) id 1WVGwT-0006BS-FK
	for qemu-trivial@nongnu.org; Wed, 02 Apr 2014 04:54:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agraf@suse.com>) id 1WVGwN-0001mk-JE
	for qemu-trivial@nongnu.org; Wed, 02 Apr 2014 04:54:41 -0400
Received: from cantor2.suse.de ([195.135.220.15]:50072 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.com>)
	id 1WVGwA-0001kG-Px; Wed, 02 Apr 2014 04:54:22 -0400
Received: from relay1.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 8BCEBABA3;
	Wed,  2 Apr 2014 08:54:20 +0000 (UTC)
Message-ID: <533BD03A.7070405@suse.com>
Date: Wed, 02 Apr 2014 10:54:18 +0200
From: Alexander Graf <agraf@suse.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>, 
	Prasad Joshi <prasadjoshi.linux@gmail.com>
References: <1395566923-5074-1-git-send-email-prasadjoshi.linux@gmail.com>
	<1395566923-5074-2-git-send-email-prasadjoshi.linux@gmail.com>
	<5330405F.7040306@suse.de>
In-Reply-To: <5330405F.7040306@suse.de>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.135.220.15
X-Mailman-Approved-At: Wed, 02 Apr 2014 09:58:32 -0400
Cc: peter.maydell@linaro.org, aliguori@amazon.com, aik@ozlabs.ru,
	jan.kiszka@siemens.com, riku.voipio@iki.fi, agraf@suse.de,
	v.maffione@gmail.com, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, av1474@comtv.ru, stefanha@redhat.com,
	pbonzini@redhat.com, g.lettieri@iet.unipi.it, alex@alex.org.uk,
	rizzo@iet.unipi.it, kraxel@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/6] intc/openpic_kvm: fix
 MemListener delete regiion callback function
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
X-List-Received-Date: Wed, 02 Apr 2014 08:54:47 -0000


On 24.03.14 15:25, Andreas F=E4rber wrote:
> Am 23.03.2014 10:28, schrieb Prasad Joshi:
>> Signed-off-by: Prasad Joshi <prasadjoshi.linux@gmail.com>
>> ---
>>   hw/intc/openpic_kvm.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
> Thanks for spotting this, applied to ppc-next (w/ typo fix in subject):
> https://github.com/afaerber/qemu-cpu/commits/ppc-next

This patch breaks the e500 platform target.


Alex



Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZuOFW-0008LW-Ee
	for mharc-qemu-trivial@gnu.org; Thu, 05 Nov 2015 12:22:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58892)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1ZuOFU-0008Iu-Dk
	for qemu-trivial@nongnu.org; Thu, 05 Nov 2015 12:22:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1ZuOFT-00057X-Lj
	for qemu-trivial@nongnu.org; Thu, 05 Nov 2015 12:22:56 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60052)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>)
	id 1ZuOFN-00052W-DP; Thu, 05 Nov 2015 12:22:49 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 2B94FE7067;
	Thu,  5 Nov 2015 17:22:48 +0000 (UTC)
Received: from [10.10.57.107] (vpn-57-107.rdu2.redhat.com [10.10.57.107])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tA5HMjbc022168
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 5 Nov 2015 12:22:47 -0500
To: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>, qemu-arm@nongnu.org
References: <1446743477-21579-1-git-send-email-wei@redhat.com>
	<563B8E48.8020407@suse.de>
From: Wei Huang <wei@redhat.com>
Message-ID: <563B9065.8060808@redhat.com>
Date: Thu, 5 Nov 2015 11:22:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <563B8E48.8020407@suse.de>
Content-Type: text/plain; charset=iso-8859-15
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH Trivial] hw/intc/arm_gic: Remove the
	definition of NUM_CPU
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
X-List-Received-Date: Thu, 05 Nov 2015 17:22:57 -0000



On 11/05/2015 11:13 AM, Andreas F=E4rber wrote:
> Am 05.11.2015 um 18:11 schrieb Wei Huang:
>> arm_gic.c retrieves CPU number using either NUM_CPU(s) or s->num_cpu.
>> Such mixed-uses make source code inconsistent. This patch removes
>> NUM_CPU(s), which was defined for MPCore tweak long ago, and instead
>> favors s->num_cpu. The source is more consistent after this tweak.
>>
>> Signed-off-by: Wei Huang <wei@redhat.com>
>> ---
>>  hw/intc/arm_gic.c | 8 +++-----
>>  1 file changed, 3 insertions(+), 5 deletions(-)
>=20
> I don't mind either way, and it'll go through Peter's queue I guess,
>=20
> Reviewed-by: Andreas F=E4rber <afaerber@suse.de>

Thanks. I sent out a wrong file which failed the compilation. So please
ignore this file.

Yeah, maybe through Peter's tree given that he is the maintainer of this
file.

-Wei

>=20
> Cheers,
> Andreas
>=20


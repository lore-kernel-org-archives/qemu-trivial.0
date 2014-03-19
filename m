Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WQOqU-0003j9-Qu
	for mharc-qemu-trivial@gnu.org; Wed, 19 Mar 2014 18:20:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52582)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1WQOqN-0003aM-LY
	for qemu-trivial@nongnu.org; Wed, 19 Mar 2014 18:20:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1WQOqI-0005fV-Au
	for qemu-trivial@nongnu.org; Wed, 19 Mar 2014 18:20:15 -0400
Received: from cantor2.suse.de ([195.135.220.15]:58919 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1WQOpw-0005Fo-Ap; Wed, 19 Mar 2014 18:19:48 -0400
Received: from relay2.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 874207501E;
	Wed, 19 Mar 2014 22:19:47 +0000 (UTC)
Message-ID: <532A1802.9090202@suse.de>
Date: Wed, 19 Mar 2014 23:19:46 +0100
From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Tom Musta <tommusta@gmail.com>, Stuart Brady <sdb@zubnet.me.uk>
References: <20140319140726.GA9192@zubnet.me.uk> <5329B438.7090104@gmail.com>
In-Reply-To: <5329B438.7090104@gmail.com>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [Qemu-ppc] [PATCH] target-ppc: Fix
 overallocation of opcode tables
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
X-List-Received-Date: Wed, 19 Mar 2014 22:20:21 -0000

Am 19.03.2014 16:14, schrieb Tom Musta:
> On 3/19/2014 9:07 AM, Stuart Brady wrote:
>> create_new_table() should allocate 0x20 opc_handler_t pointers, but
>> actually allocates 0x20 opc_handler_t structs.  Fix this.
>>
>> Signed-off-by: Stuart Brady <sdb@zubnet.me.uk>
>=20
> Reviewed-by: Tom Musta <tommusta@gmail.com>
> Tested-by: Tom Musta <tommusta@gmail.com>

Thanks, applied to my ppc-next:
https://github.com/afaerber/qemu-cpu/commits/ppc-next

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg


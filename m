Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Um2La-0003Du-Ob
	for mharc-qemu-trivial@gnu.org; Mon, 10 Jun 2013 09:41:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48476)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1Um2LX-00039b-FP
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 09:41:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1Um2LW-00037p-AE
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 09:41:19 -0400
Received: from cantor2.suse.de ([195.135.220.15]:48514 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1Um2Fk-00015S-Bd; Mon, 10 Jun 2013 09:35:20 -0400
Received: from relay1.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id CFCF3A41E0;
	Mon, 10 Jun 2013 15:35:19 +0200 (CEST)
Message-ID: <51B5D617.9060906@suse.de>
Date: Mon, 10 Jun 2013 15:35:19 +0200
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: peter.crosthwaite@xilinx.com
References: <cover.1370236013.git.peter.crosthwaite@xilinx.com>
	<3a93fbb6bbc96792cf7b85384a2317344b77ab13.1370236013.git.peter.crosthwaite@xilinx.com>
In-Reply-To: <3a93fbb6bbc96792cf7b85384a2317344b77ab13.1370236013.git.peter.crosthwaite@xilinx.com>
X-Enigmail-Version: 1.6a1pre
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, edgar.iglesias@gmail.com, aliguori@us.ibm.com,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v1 3/3] char/serial:
 serial_ioport_write: Factor out common code
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
X-List-Received-Date: Mon, 10 Jun 2013 13:41:20 -0000

Am 03.06.2013 07:14, schrieb peter.crosthwaite@xilinx.com:
> From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
>=20
> These three lines are common to both FIFO and regular mode. Just factor
> them out to outside the if rather than replicate the same lines inside
> both if and else.
>=20
> Cc: qemu-trivial@nongnu.org
>=20
> Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

Reviewed-by: Andreas F=E4rber <afaerber@suse.de>

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg


Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aIYng-0003aM-Ju
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jan 2016 04:30:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34768)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jonathan.ashley@altran.com>) id 1aIYnd-0003Ue-Cs
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 04:30:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jonathan.ashley@altran.com>) id 1aIYnZ-0003q8-0H
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 04:30:05 -0500
Received: from mx08-001f8a01.pphosted.com ([91.207.212.157]:53477)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jonathan.ashley@altran.com>)
	id 1aIYnY-0003oh-OB; Mon, 11 Jan 2016 04:30:00 -0500
Received: from pps.filterd (m0090857.ppops.net [127.0.0.1])
	by mx08-001f8a01.pphosted.com (8.15.0.59/8.15.0.59) with SMTP id
	u0B9T8uZ019064; Mon, 11 Jan 2016 10:29:57 +0100
Received: from xch-20v-dcfr-01.europe.corp.altran.com ([194.98.79.104])
	by mx08-001f8a01.pphosted.com with ESMTP id 20atnesy80-1
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NOT);
	Mon, 11 Jan 2016 10:29:56 +0100
Received: from XMB-DCFR-37.europe.corp.altran.com
	([fe80::80ba:99a3:be27:fa11]) by XCH-20V-DCFR-01.europe.corp.altran.com
	([fe80::1c20:d485:89b1:a288%13]) with mapi id 14.03.0248.002;
	Mon, 11 Jan 2016 10:29:57 +0100
From: Ashley Jonathan <jonathan.ashley@altran.com>
To: Paolo Bonzini <pbonzini@redhat.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
Thread-Topic: [PATCH] Keep pty slave file descriptor open until the master
	is closed
Thread-Index: AdE0BeDuGw5r/QTuRKe5Y8+l1lqE9AYQnQwAAAKOQNA=
Date: Mon, 11 Jan 2016 09:29:55 +0000
Message-ID: <AC19797808C8D548ABDE0CA4A97AA30A9167916D@XMB-DCFR-37.europe.corp.altran.com>
References: <AC19797808C8D548ABDE0CA4A97AA30A30DEB409@XMB-DCFR-37.europe.corp.altran.com>
	<569372DC.5020606@redhat.com>
In-Reply-To: <569372DC.5020606@redhat.com>
Accept-Language: en-GB, fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.6.254]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-01-11_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outgoing_spam_policy_notspam
	policy=outgoing_spam_policy score=0
	spamscore=0 suspectscore=0 malwarescore=0 phishscore=0 adultscore=0
	bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.0.1-1507310008 definitions=main-1601110173
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 91.207.212.157
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] Keep pty slave file descriptor open
 until the master is closed
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
X-List-Received-Date: Mon, 11 Jan 2016 09:30:06 -0000

Apologies; I overlooked that detail:

Signed-off-by: Ashley Jonathan <jonathan.ashley@altran.com>

Regards,
--
Jon Ashley

-----Original Message-----
From: Paolo Bonzini [mailto:paolo.bonzini@gmail.com] On Behalf Of Paolo Bon=
zini
Sent: 11 January 2016 09:16
To: Ashley Jonathan; qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Subject: Re: [PATCH] Keep pty slave file descriptor open until the master i=
s closed



On 11/12/2015 12:29, Ashley Jonathan wrote:
> I have experienced a minor difficulty using QEMU with the "-serial=20
> pty" option:
>=20
> If a process opens the slave pts device, writes data to it, then=20
> immediately closes it, the data doesn't reliably get delivered to the=20
> emulated serial port. This seems to be because a read of the master=20
> pty device returns EIO on Linux if no process has the pts device open,=20
> even when data is waiting "in the pipe".
>=20
> A fix seems to be for QEMU to keep the pts file descriptor open until=20
> the pty is closed, as per the below patch.

You need to include a "Signed-off-by: Ashley Jonathan <jonathan.ashley@altr=
an.com>"
line in the commit message, meaning that you have read and understood the "=
Developer Certificate of Origin":

http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documen=
tation/SubmittingPatches?id=3Df6f94e2ab1b33f0082ac22d71f66385a60d8157f#n297

Just reply to this message with the above line.

Paolo


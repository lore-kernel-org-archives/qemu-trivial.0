Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwt5r-0005IK-DP
	for mharc-qemu-trivial@gnu.org; Tue, 26 Sep 2017 12:52:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47000)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dwt5n-0005DG-FZ
	for qemu-trivial@nongnu.org; Tue, 26 Sep 2017 12:52:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dwt5m-0001th-Nn
	for qemu-trivial@nongnu.org; Tue, 26 Sep 2017 12:52:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52150)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dwt5i-0001mT-Jy; Tue, 26 Sep 2017 12:52:14 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 86D685AFD9;
	Tue, 26 Sep 2017 16:52:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 86D685AFD9
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.36.116.52] (ovpn-116-52.ams2.redhat.com [10.36.116.52])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 14B24183C3;
	Tue, 26 Sep 2017 16:52:11 +0000 (UTC)
To: Alistair Francis <alistair.francis@xilinx.com>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>, 
	Peter Maydell <peter.maydell@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
References: <1506441116-16627-1-git-send-email-thuth@redhat.com>
	<CAKmqyKOCsyCHnaNzo_zrRQjZi30ENdPoSc+dFehHvevm-9nrZg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <cbcf25a4-db9c-910f-fdbc-b7620d013b14@redhat.com>
Date: Tue, 26 Sep 2017 18:52:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKOCsyCHnaNzo_zrRQjZi30ENdPoSc+dFehHvevm-9nrZg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 26 Sep 2017 16:52:13 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/arm/xlnx-zynqmp: Mark
 the "xlnx, zynqmp" device with user_creatable = false
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
X-List-Received-Date: Tue, 26 Sep 2017 16:52:22 -0000

On 26.09.2017 18:36, Alistair Francis wrote:
> On Tue, Sep 26, 2017 at 8:51 AM, Thomas Huth <thuth@redhat.com> wrote:
>> The device uses serial_hds in its realize function and thus can't be
>> used twice. Apart from that, the comma in its name makes it quite hard
>> to use for the user anyway, since a comma is normally used to separate
>> the device name from its properties when using the "-device" parameter
>> or the "device_add" HMP command.
>=20
> Is it worth changing the name now then as well?

Not sure, was there a reason for this name? E.g. is it used in a device
tree somewhere somehow? Anyway, with user_creatable =3D false, I think it
is not so urgent anymore to change it.

>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>=20
> Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks!

 Thomas


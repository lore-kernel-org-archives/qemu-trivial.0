Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Qliti-0003Sc-SR
	for mharc-qemu-trivial@gnu.org; Tue, 26 Jul 2011 10:46:14 -0400
Received: from eggs.gnu.org ([140.186.70.92]:57247)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1Qlitg-0003SU-7w
	for qemu-trivial@nongnu.org; Tue, 26 Jul 2011 10:46:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1Qlitb-0007Bq-BY
	for qemu-trivial@nongnu.org; Tue, 26 Jul 2011 10:46:12 -0400
Received: from e8.ny.us.ibm.com ([32.97.182.138]:46407)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>)
	id 1Qlitb-0007Bg-99; Tue, 26 Jul 2011 10:46:07 -0400
Received: from d01relay03.pok.ibm.com (d01relay03.pok.ibm.com [9.56.227.235])
	by e8.ny.us.ibm.com (8.14.4/8.13.1) with ESMTP id p6QEXLfE009291;
	Tue, 26 Jul 2011 10:33:21 -0400
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])
	by d01relay03.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	p6QEk4Wk154058; Tue, 26 Jul 2011 10:46:04 -0400
Received: from d01av01.pok.ibm.com (loopback [127.0.0.1])
	by d01av01.pok.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	p6QEk1Wi006620; Tue, 26 Jul 2011 10:46:04 -0400
Received: from [9.59.241.154] (d941e-10.watson.ibm.com [9.59.241.154])
	by d01av01.pok.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	p6QEjwU3006447; Tue, 26 Jul 2011 10:45:58 -0400
Message-ID: <4E2ED326.3050604@linux.vnet.ibm.com>
Date: Tue, 26 Jul 2011 10:45:58 -0400
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc14
	Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1311690791.7898.6.camel@d941e-10>
	<CAFEAcA9DGt79M91VM8=S218WOuq2bHdgWuZtYQigfWPWObFu3w@mail.gmail.com>
In-Reply-To: <CAFEAcA9DGt79M91VM8=S218WOuq2bHdgWuZtYQigfWPWObFu3w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by e8.ny.us.ibm.com id
	p6QEXLfE009291
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6, seldom 2.4 (older,
	4)
X-Received-From: 32.97.182.138
Cc: qemu-trivial@nongnu.org, aliguori@us.ibm.com,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Fix a compilation error in
	xen-mapcache.c
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
X-List-Received-Date: Tue, 26 Jul 2011 14:46:13 -0000

On 07/26/2011 10:38 AM, Peter Maydell wrote:
> On 26 July 2011 15:33, Stefan Berger<stefanb@linux.vnet.ibm.com>  wrote=
:
>> This patch fixes a compilation error in xen-mapcache.c .
>>
>> /home/stefanb/qemu/qemu-git/xen-mapcache.c: In function =E2=80=98xen_r=
am_addr_from_mapcache=E2=80=99:
>> /home/stefanb/qemu/qemu-git/xen-mapcache.c:240:42: error: variable =E2=
=80=98pentry=E2=80=99 set but not used [-Werror=3Dunused-but-set-variable=
]
>> cc1: all warnings being treated as errors
> Juan posted a fix for this back on the 11th:
>
> http://patchwork.ozlabs.org/patch/104254/
>
Then I can only emphasize the importance of this patch.

   Stefan

> -- PMM



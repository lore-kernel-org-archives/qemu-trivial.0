Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cW7m6-0005qX-SY
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jan 2017 15:33:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39943)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1cW7ly-0005l0-0z
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 15:33:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1cW7lx-0004XL-9u
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 15:32:58 -0500
Received: from mx1.redhat.com ([209.132.183.28]:37692)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1cW7ln-0004Up-Ji; Tue, 24 Jan 2017 15:32:47 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 979CDC04BD2F;
	Tue, 24 Jan 2017 20:32:47 +0000 (UTC)
Received: from [10.36.116.24] (ovpn-116-24.ams2.redhat.com [10.36.116.24])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v0OKWjQu021224
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 24 Jan 2017 15:32:46 -0500
To: Valentin Plotkin <caliborn@SDF.ORG>, qemu-trivial@nongnu.org
References: <Pine.NEB.4.64.1701241855380.2138@sdf.lonestar.org>
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
From: Thomas Huth <thuth@redhat.com>
Message-ID: <4b93a2b8-097e-a502-875e-21ea394c617a@redhat.com>
Date: Tue, 24 Jan 2017 21:32:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <Pine.NEB.4.64.1701241855380.2138@sdf.lonestar.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 24 Jan 2017 20:32:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-ppc] [PATCH] PPC: MMU compatibility check.
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
X-List-Received-Date: Tue, 24 Jan 2017 20:33:03 -0000

On 24.01.2017 19:56, Valentin Plotkin wrote:
> 
> Hi everyone,
> 
> I looked at the "qemu-system-ppc -nographic -cpu G2leGP3 -M ppce500" on
> the BiteSizedTasks page. The segfault was caused by machine
> initialization code which expected a certain MMU model, checked, so
> unused SPR were read, returning zeros. bamboo and virtex machines are
> affected as well, but it doesn't always cause segfault, usually running
> into unmapped memory and failing somewhat more nicely.
> 
> I added the checks. It would be possible to add support for other MMU
> models, but I'm not sure if there is any point (would any guest OS
> support mutually exclusive CPU and machine)?

 Hi,

great to have a fix for this crash! I don't think it make much sense to
add support for other MMU models here, so the simple checks should be
good enough.
However, your new code obviously does not follow the QEMU coding style.
Could you please run your patch through scripts/checkpatch.pl and fix
all issues that it reports? And when you resubmit, please make sure to
copy the maintainers on CC: as well (scripts/get_maintainers.pl is your
friend here).

 Thanks,
  Thomas



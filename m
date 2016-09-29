Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bpeHS-0002kX-6A
	for mharc-qemu-trivial@gnu.org; Thu, 29 Sep 2016 12:33:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59437)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bpeHQ-0002im-7S
	for qemu-trivial@nongnu.org; Thu, 29 Sep 2016 12:33:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bpeHP-0006x5-Cm
	for qemu-trivial@nongnu.org; Thu, 29 Sep 2016 12:33:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56516)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1bpeHH-0006tE-0z; Thu, 29 Sep 2016 12:33:43 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8175831B31E;
	Thu, 29 Sep 2016 16:33:42 +0000 (UTC)
Received: from [10.36.116.32] (ovpn-116-32.ams2.redhat.com [10.36.116.32])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8TGXdY5018272
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 29 Sep 2016 12:33:41 -0400
To: Peter Maydell <peter.maydell@linaro.org>
References: <1474633117-5227-1-git-send-email-thuth@redhat.com>
	<CAFEAcA9Ng0dikY=bwebUVz0AJTtm7GCYkcigXRhD9rMhXzZabw@mail.gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <f19f2e51-7ff9-f9dd-8632-0b7a42ada8dd@redhat.com>
Date: Thu, 29 Sep 2016 18:33:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9Ng0dikY=bwebUVz0AJTtm7GCYkcigXRhD9rMhXzZabw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 29 Sep 2016 16:33:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] MAINTAINERS: Add some ARM related files
 to the corresponding sections
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
X-List-Received-Date: Thu, 29 Sep 2016 16:33:53 -0000

On 29.09.2016 18:08, Peter Maydell wrote:
> On 23 September 2016 at 05:18, Thomas Huth <thuth@redhat.com> wrote:
>> The file hw/misc/arm_integrator_debug.c seems to belong to Integrator
>> CP, and hw/cpu/realview_mpcore.c and hw/misc/arm_sysctl.c seem to
>> belong to Real View.
> 
> arm_sysctl is also used in the Versatile PB and Vexpress boards;
> it's not specific to realview.

Oh, indeed, ... but how should this file then best be represented in
MAINTAINERS? Adding multiple entries for one file is kind of ugly, too,
isn't it?

 Thomas



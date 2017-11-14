Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eEW2n-0005ws-UA
	for mharc-qemu-trivial@gnu.org; Tue, 14 Nov 2017 02:54:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58403)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eEW2l-0005vr-P7
	for qemu-trivial@nongnu.org; Tue, 14 Nov 2017 02:54:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eEW2k-0005Qh-V8
	for qemu-trivial@nongnu.org; Tue, 14 Nov 2017 02:54:03 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33562)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1eEW2e-0005Li-US; Tue, 14 Nov 2017 02:53:57 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C5E6480481;
	Tue, 14 Nov 2017 07:53:55 +0000 (UTC)
Received: from [10.36.116.149] (ovpn-116-149.ams2.redhat.com [10.36.116.149])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4ED6B1897E;
	Tue, 14 Nov 2017 07:53:54 +0000 (UTC)
To: Alistair Francis <alistair.francis@xilinx.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: alistair23@gmail.com, Anthony Green <green@moxielogic.com>,
	armbru@redhat.com
References: <cover.1510612380.git.alistair.francis@xilinx.com>
	<ccfeb16d932f9570efc871c6aa1c2d1229bf31ba.1510612380.git.alistair.francis@xilinx.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <3220ca4b-12f9-727e-da70-188dd1f9c262@redhat.com>
Date: Tue, 14 Nov 2017 08:53:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <ccfeb16d932f9570efc871c6aa1c2d1229bf31ba.1510612380.git.alistair.francis@xilinx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 14 Nov 2017 07:53:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v5 15/29] hw/moxie: Replace
 fprintf(stderr, "*\n" with error_report()
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
X-List-Received-Date: Tue, 14 Nov 2017 07:54:04 -0000

On 13.11.2017 23:35, Alistair Francis wrote:
> Replace a large number of the fprintf(stderr, "*\n" calls with
> error_report(). The functions were renamed with these commands and then
> compiler issues where manually fixed.

Reviewed-by: Thomas Huth <thuth@redhat.com>


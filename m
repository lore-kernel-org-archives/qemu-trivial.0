Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cbj8p-0002Qk-8A
	for mharc-qemu-trivial@gnu.org; Thu, 09 Feb 2017 02:27:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34306)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cbj8n-0002Lf-2h
	for qemu-trivial@nongnu.org; Thu, 09 Feb 2017 02:27:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cbj8m-0006t4-CK
	for qemu-trivial@nongnu.org; Thu, 09 Feb 2017 02:27:41 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53702)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1cbj8i-0006sU-5N; Thu, 09 Feb 2017 02:27:36 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 574B9C04B927;
	Thu,  9 Feb 2017 07:27:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-50.ams2.redhat.com
	[10.36.116.50])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v197RZBr032077
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 9 Feb 2017 02:27:36 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id BCBB41138646; Thu,  9 Feb 2017 08:27:33 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Alistair Francis <alistair.francis@xilinx.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <1486576669-29760-1-git-send-email-thuth@redhat.com>
Date: Thu, 09 Feb 2017 08:27:33 +0100
In-Reply-To: <1486576669-29760-1-git-send-email-thuth@redhat.com> (Thomas
	Huth's message of "Wed, 8 Feb 2017 18:57:49 +0100")
Message-ID: <87mvdvaknu.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 09 Feb 2017 07:27:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3] hw/core/or-irq: Mark the
 device with cannot_instantiate_with_device_add_yet
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
X-List-Received-Date: Thu, 09 Feb 2017 07:27:42 -0000

Thomas Huth <thuth@redhat.com> writes:

> The "or-irq" device needs to be wired up in source code, there is no
> way the user can make any real use of this device with the "-device"
> parameter or the "device_add" monitor command yet.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Markus Armbruster <armbru@redhat.com>


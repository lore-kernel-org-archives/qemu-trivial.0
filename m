Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cbj8g-0002FV-5q
	for mharc-qemu-trivial@gnu.org; Thu, 09 Feb 2017 02:27:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34264)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cbj8e-0002Dy-5k
	for qemu-trivial@nongnu.org; Thu, 09 Feb 2017 02:27:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1cbj8d-0006ru-EI
	for qemu-trivial@nongnu.org; Thu, 09 Feb 2017 02:27:32 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40418)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1cbj8a-0006qj-CG; Thu, 09 Feb 2017 02:27:28 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7ECC77E9E5;
	Thu,  9 Feb 2017 07:27:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-50.ams2.redhat.com
	[10.36.116.50])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v197RRKi026479
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 9 Feb 2017 02:27:28 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id DFCC11138646; Thu,  9 Feb 2017 08:27:25 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Alistair Francis <alistair.francis@xilinx.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <1486576658-29719-1-git-send-email-thuth@redhat.com>
Date: Thu, 09 Feb 2017 08:27:25 +0100
In-Reply-To: <1486576658-29719-1-git-send-email-thuth@redhat.com> (Thomas
	Huth's message of "Wed, 8 Feb 2017 18:57:38 +0100")
Message-ID: <87r337ako2.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 09 Feb 2017 07:27:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3] hw/core/register: Mark
 the device with cannot_instantiate_with_device_add_yet
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
X-List-Received-Date: Thu, 09 Feb 2017 07:27:33 -0000

Thomas Huth <thuth@redhat.com> writes:

> The "qemu,register" device needs to be wired up in source code, there
> is no way the user can make any real use of this device with the
> "-device" parameter or the "device_add" monitor command yet.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Markus Armbruster <armbru@redhat.com>


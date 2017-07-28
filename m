Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1db4W9-0006cl-BB
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 08:37:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46404)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1db4W7-0006br-GK
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 08:37:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1db4W6-0004Q1-MT
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 08:37:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46400)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1db4W1-0004MV-Ve; Fri, 28 Jul 2017 08:37:14 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EB16736EE70;
	Fri, 28 Jul 2017 12:37:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com EB16736EE70
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=cohuck@redhat.com
Received: from gondolin (dhcp-192-215.str.redhat.com [10.33.192.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 01EBC19174;
	Fri, 28 Jul 2017 12:37:11 +0000 (UTC)
Date: Fri, 28 Jul 2017 14:37:09 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVk?=
	=?UTF-8?B?w6k=?= <f4bug@amsat.org>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Message-ID: <20170728143709.5bfee839@gondolin>
In-Reply-To: <3a4f3a2a-cebc-e730-4a63-2616a17f5f2b@redhat.com>
References: <20170728053610.15770-1-f4bug@amsat.org>
	<20170728053610.15770-6-f4bug@amsat.org>
	<a7fdc125-9a1b-bec3-915f-e8f764816b0d@redhat.com>
	<c44770f5-df9d-2340-5dba-2f5db7acd046@redhat.com>
	<20170728135614.3f14e3ad@gondolin>
	<3abbfa87-d882-39ab-b4ab-66f3e68a2fb4@redhat.com>
	<20170728141353.3b8382be@gondolin>
	<3a4f3a2a-cebc-e730-4a63-2616a17f5f2b@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 28 Jul 2017 12:37:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 05/47] MAINTAINERS: add
 missing KVM entry
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
X-List-Received-Date: Fri, 28 Jul 2017 12:37:20 -0000

On Fri, 28 Jul 2017 14:25:08 +0200
Paolo Bonzini <pbonzini@redhat.com> wrote:

> Sometime people pull changes too early, or otherwise I want to comment
> on the timing of the change...

Might be helpful to add magic to checkpatch to verify that any headers
change is done via running the script against a specified Linux
version. (This is beyond my non-existing perl skills, unfortunately.)

> I don't know, I already get too much
> qemu-devel email. :)

I can certainly agree with that statement :)


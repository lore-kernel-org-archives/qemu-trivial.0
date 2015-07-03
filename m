Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZB4k3-0001hj-Dv
	for mharc-qemu-trivial@gnu.org; Fri, 03 Jul 2015 13:27:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56917)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZB4k0-0001dv-Of
	for qemu-trivial@nongnu.org; Fri, 03 Jul 2015 13:27:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZB4jz-000347-Sb
	for qemu-trivial@nongnu.org; Fri, 03 Jul 2015 13:27:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46512)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1ZB4ju-000326-Dk; Fri, 03 Jul 2015 13:27:02 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 58468B1F8E;
	Fri,  3 Jul 2015 17:27:01 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-44.ams2.redhat.com
	[10.36.116.44])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t63HQuve004799
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 3 Jul 2015 13:27:00 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id BF477303FEAE; Fri,  3 Jul 2015 19:26:53 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
References: <1435933104-15216-1-git-send-email-peter.maydell@linaro.org>
Date: Fri, 03 Jul 2015 19:26:53 +0200
In-Reply-To: <1435933104-15216-1-git-send-email-peter.maydell@linaro.org>
	(Peter Maydell's message of "Fri, 3 Jul 2015 15:18:24 +0100")
Message-ID: <87twtlywwy.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Stop including
	qemu-common.h in memory.h
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
X-List-Received-Date: Fri, 03 Jul 2015 17:27:09 -0000

Peter Maydell <peter.maydell@linaro.org> writes:

> Including qemu-common.h from other header files is generally a bad
> idea, because it means it's very easy to end up with a circular
> dependency. For instance, if we wanted to include memory.h from
> qom/cpu.h we'd end up with this loop:
>  memory.h -> qemu-common.h -> cpu.h -> cpu-qom.h -> qom/cpu.h -> memory.h
>
> Remove the include from memory.h. This requires us to fix up a few
> other files which were inadvertently getting declarations indirectly
> through memory.h.
>
> The biggest change is splitting the fprintf_function typedef out
> into its own header so other headers can get at it without having
> to include qemu-common.h.

Why not simply put it in qemu/typedefs.h?

> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I originally wrote this because I thought I was going to need to
> include memory.h in qom/cpu.h. In fact I managed to avoid that in
> the end, but this still seems like useful cleanup.

Yup.


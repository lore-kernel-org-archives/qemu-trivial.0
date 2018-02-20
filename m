Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eo4My-00039i-Id
	for mharc-qemu-trivial@gnu.org; Tue, 20 Feb 2018 04:37:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48602)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kchamart@redhat.com>) id 1eo4Mw-000384-6a
	for qemu-trivial@nongnu.org; Tue, 20 Feb 2018 04:37:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kchamart@redhat.com>) id 1eo4Mv-0007SM-FA
	for qemu-trivial@nongnu.org; Tue, 20 Feb 2018 04:37:50 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:53408 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kchamart@redhat.com>)
	id 1eo4Mr-0007Rh-Kp; Tue, 20 Feb 2018 04:37:45 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 91D0540FB646;
	Tue, 20 Feb 2018 09:37:41 +0000 (UTC)
Received: from eukaryote.localdomain (ovpn-117-234.ams2.redhat.com
	[10.36.117.234])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 608072026E04;
	Tue, 20 Feb 2018 09:37:37 +0000 (UTC)
Received: by eukaryote.localdomain (Postfix, from userid 1000)
	id 3A56B241FF4; Tue, 20 Feb 2018 10:37:35 +0100 (CET)
Date: Tue, 20 Feb 2018 10:37:35 +0100
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20180220093735.j5sshv7d357ayp3h@eukaryote>
References: <1519071820-4062-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1519071820-4062-1-git-send-email-thuth@redhat.com>
User-Agent: NeoMutt/20171215
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Tue, 20 Feb 2018 09:37:41 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Tue, 20 Feb 2018 09:37:41 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kchamart@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Remove the deprecated -tdf
 option
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
X-List-Received-Date: Tue, 20 Feb 2018 09:37:51 -0000

On Mon, Feb 19, 2018 at 09:23:40PM +0100, Thomas Huth wrote:
> It's been marked as deprecated since a very long time already, and
> the parameter is not doing anything useful anymore except for printing
> a warning, so it's now time to finally get rid of this option.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  qemu-doc.texi | 7 -------
>  vl.c          | 3 ---
>  2 files changed, 10 deletions(-)

Nice catch.

Reviewed-by: Kashyap Chamarthy <kchamart@redhat.com>

[...]

-- 
/kashyap


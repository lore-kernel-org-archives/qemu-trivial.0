Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WAdZk-0000vx-9M
	for mharc-qemu-trivial@gnu.org; Tue, 04 Feb 2014 05:49:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44797)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1WAdZd-0000ug-9U
	for qemu-trivial@nongnu.org; Tue, 04 Feb 2014 05:49:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1WAdZY-0005ng-4a
	for qemu-trivial@nongnu.org; Tue, 04 Feb 2014 05:49:49 -0500
Received: from mx1.redhat.com ([209.132.183.28]:9476)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>)
	id 1WAdZX-0005nV-Sk; Tue, 04 Feb 2014 05:49:44 -0500
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s14AngFK007346
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 4 Feb 2014 05:49:42 -0500
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-116-85.ams2.redhat.com
	[10.36.116.85])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s14AnehZ022154; Tue, 4 Feb 2014 05:49:41 -0500
Message-ID: <52F0C5C4.80102@redhat.com>
Date: Tue, 04 Feb 2014 11:49:40 +0100
From: Laszlo Ersek <lersek@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131118 Thunderbird/17.0.11
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1391492590-8844-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1391492590-8844-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] misc: Fix case Qemu -> QEMU
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
X-List-Received-Date: Tue, 04 Feb 2014 10:49:54 -0000

On 02/04/14 06:43, Stefan Weil wrote:
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  scripts/switch-timer-api |    2 +-
>  tests/i440fx-test.c      |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/switch-timer-api b/scripts/switch-timer-api
> index a369a08..b0e230b 100755
> --- a/scripts/switch-timer-api
> +++ b/scripts/switch-timer-api
> @@ -20,7 +20,7 @@ sub Syntax
>      print STDERR <<STOP;
>  Usage: $FindBin::Script [options] FILE ...
>  
> -Translate each FILE to the new Qemu timer API. If no files
> +Translate each FILE to the new QEMU timer API. If no files
>  are passed, a reasonable guess is taken.
>  
>  Options:
> diff --git a/tests/i440fx-test.c b/tests/i440fx-test.c
> index fa3e3d6..bcd2181 100644
> --- a/tests/i440fx-test.c
> +++ b/tests/i440fx-test.c
> @@ -350,7 +350,7 @@ static void test_i440fx_firmware(FirmwareTestFixture *fixture,
>      qtest_start(cmdline);
>      g_free(cmdline);
>  
> -    /* Qemu has loaded the firmware (because qtest_start() only returns after
> +    /* QEMU has loaded the firmware (because qtest_start() only returns after
>       * the QMP handshake completes). We must unlink the firmware blob right
>       * here, because any assertion firing below would leak it in the
>       * filesystem. This is also the reason why we recreate the blob every time
> 

(I'm fine both ways.)

Reviewed-by: Laszlo Ersek <lersek@redhat.com>


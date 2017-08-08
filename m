Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1df4y7-00073O-PK
	for mharc-qemu-trivial@gnu.org; Tue, 08 Aug 2017 09:54:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39741)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1df4y1-0006wv-16
	for qemu-trivial@nongnu.org; Tue, 08 Aug 2017 09:54:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1df4xw-0007tk-6s
	for qemu-trivial@nongnu.org; Tue, 08 Aug 2017 09:54:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51912)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1df4xb-0007dg-3y; Tue, 08 Aug 2017 09:54:15 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DF42EDB93B;
	Tue,  8 Aug 2017 13:54:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com DF42EDB93B
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=kwolf@redhat.com
Received: from dhcp-200-186.str.redhat.com (dhcp-200-186.str.redhat.com
	[10.33.200.186])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 15EB77CE11;
	Tue,  8 Aug 2017 13:54:08 +0000 (UTC)
Date: Tue, 8 Aug 2017 15:54:07 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, edgar.iglesias@xilinx.com, stefanha@redhat.com,
	mreitz@redhat.com, qemu-block@nongnu.org, qemu-trivial@nongnu.org,
	Jiri Pirko <jiri@resnulli.us>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Message-ID: <20170808135407.GK4850@dhcp-200-186.str.redhat.com>
References: <20170703180950.9895-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170703180950.9895-1-eblake@redhat.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 08 Aug 2017 13:54:14 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v4] tests: Avoid non-portable 'echo -ARG'
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
X-List-Received-Date: Tue, 08 Aug 2017 13:54:46 -0000

Am 03.07.2017 um 20:09 hat Eric Blake geschrieben:
> POSIX says that backslashes in the arguments to 'echo', as well as
> any use of 'echo -n' and 'echo -e', are non-portable; it recommends
> people should favor 'printf' instead.  This is definitely true where
> we do not control which shell is running (such as in makefile snippets
> or in documentation examples).  But even for scripts where we
> require bash (and therefore, where echo does what we want by default),
> it is still possible to use 'shopt -s xpg_echo' to change bash's
> behavior of echo.  And setting a good example never hurts when we are
> not sure if a snippet will be copied from a bash-only script to a
> general shell script (although I don't change the use of non-portable
> \e for ESC when we know the running shell is bash).
> 
> Replace 'echo -n "..."' with 'printf %s "..."', and 'echo -e "..."'
> with 'printf %b "...\n"', with the optimization that the %s/%b
> argument can be omitted if the string being printed is a strict
> literal with no '%', '$', or '`' (we could technically also make
> this optimization when there are $ or `` substitutions but where
> we can prove their results will not be problematic, but proving
> that such substitutions are safe makes the patch less trivial
> compared to just being consistent).
> 
> In the qemu-iotests check script, fix unusual shell quoting
> that would result in word-splitting if 'date' outputs a space.
> 
> In test 051, take an opportunity to shorten the line.
> 
> In test 068, get rid of a pointless second invocation of bash.
> 
> CC: qemu-trivial@nongnu.org
> Signed-off-by: Eric Blake <eblake@redhat.com>

> diff --git a/tests/multiboot/run_test.sh b/tests/multiboot/run_test.sh
> index 78d7edf..c8f3da8 100755
> --- a/tests/multiboot/run_test.sh
> +++ b/tests/multiboot/run_test.sh
> @@ -26,7 +26,7 @@ run_qemu() {
>      local kernel=$1
>      shift
> 
> -    echo -e "\n\n=== Running test case: $kernel $@ ===\n" >> test.log
> +    printf %b "\n\n=== Running test case: $kernel $@ ===\n\n" >> test.log
> 
>      $QEMU \
>          -kernel $kernel \

Not completely sure why, but this broke the test with whitespace changes
like this:

-=== Running test case: mmap.elf -m 1.1M ===
+=== Running test case: mmap.elf -m1.1M ===

Kevin


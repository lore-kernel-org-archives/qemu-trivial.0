Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gmNbx-0007ZR-Dp
	for mharc-qemu-trivial@gnu.org; Wed, 23 Jan 2019 13:50:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35722)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gmNbv-0007XP-8q
	for qemu-trivial@nongnu.org; Wed, 23 Jan 2019 13:50:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gmNbu-0002wa-AM
	for qemu-trivial@nongnu.org; Wed, 23 Jan 2019 13:50:51 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51660)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gmNbr-0002uo-Tr; Wed, 23 Jan 2019 13:50:48 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C2D333DE2C;
	Wed, 23 Jan 2019 18:50:45 +0000 (UTC)
Received: from localhost (ovpn-116-63.gru2.redhat.com [10.97.116.63])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 27EA2177D0;
	Wed, 23 Jan 2019 18:50:44 +0000 (UTC)
Date: Wed, 23 Jan 2019 16:50:43 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Nisarg Shah <nshah@disroot.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20190123185043.GV4136@habkost.net>
References: <20190116183358.30287-1-nshah@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190116183358.30287-1-nshah@disroot.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 23 Jan 2019 18:50:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] device-crash-test: Convert to Python 3
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
X-List-Received-Date: Wed, 23 Jan 2019 18:50:52 -0000

On Thu, Jan 17, 2019 at 12:03:58AM +0530, Nisarg Shah wrote:
> Apply 2to3 tool to scripts/device-crash-test.
> Restrict whitelist entry stats in debug mode to be sorted only by "count", since Python 3 does
> not implicitly support comparing dictionaries.

Thanks for the patch.  Comments below:

> 
> Signed-off-by: Nisarg Shah <nshah@disroot.org>
> ---
>  scripts/device-crash-test | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/device-crash-test b/scripts/device-crash-test
> index e93a7c0c84..ecdc9828c2 100755
> --- a/scripts/device-crash-test
> +++ b/scripts/device-crash-test
> @@ -23,7 +23,7 @@
>  Run QEMU with all combinations of -machine and -device types,
>  check for crashes and unexpected errors.
>  """
> -from __future__ import print_function
> +

This breaks Python 2 support:

$ python2 scripts/device-crash-test
  File "scripts/device-crash-test", line 534
    print("No QEMU binary found", file=sys.stderr)
                                      ^
SyntaxError: invalid syntax


>  
>  import sys
>  import os
> @@ -272,7 +272,7 @@ def qemuOptsEscape(s):
>  
>  def formatTestCase(t):
>      """Format test case info as "key=value key=value" for prettier logging output"""
> -    return ' '.join('%s=%s' % (k, v) for k, v in t.items())
> +    return ' '.join('%s=%s' % (k, v) for k, v in list(t.items()))

Why is this necessary?


>  
>  
>  def qomListTypeNames(vm, **kwargs):
> @@ -574,7 +574,8 @@ def main():
>          logger.info("Skipped %d test cases", skipped)
>  
>      if args.debug:
> -        stats = sorted([(len(wl_stats.get(i, [])), wl) for i, wl in enumerate(ERROR_WHITELIST)])
> +        stats = sorted([(len(wl_stats.get(i, [])), wl) for i, wl in
> +                         enumerate(ERROR_WHITELIST)], key=lambda x: x[0])

This seems to be the only change that is described in the commit
message.  I'm applying this hunk after editing the commit message
as shown below.

---
From 9793d7e7874d944d115ab9ab933b02f8de793460 Mon Sep 17 00:00:00 2001
From: Nisarg Shah <nshah@disroot.org>
Date: Thu, 17 Jan 2019 00:03:58 +0530
Subject: [PATCH] device-crash-test: Python 3 compatibility fix

Restrict whitelist entry stats in debug mode to be sorted only by
"count", since Python 3 does not implicitly support comparing
dictionaries.

Signed-off-by: Nisarg Shah <nshah@disroot.org>
Message-Id: <20190116183358.30287-1-nshah@disroot.org>
[ehabkost: removed 2 unnecessary hunks from patch]
[ehabkost: edited commit message]
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 scripts/device-crash-test | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/device-crash-test b/scripts/device-crash-test
index 483dafb2fc..2a13fa4f84 100755
--- a/scripts/device-crash-test
+++ b/scripts/device-crash-test
@@ -557,7 +557,8 @@ def main():
         logger.info("Skipped %d test cases", skipped)
 
     if args.debug:
-        stats = sorted([(len(wl_stats.get(i, [])), wl) for i, wl in enumerate(ERROR_WHITELIST)])
+        stats = sorted([(len(wl_stats.get(i, [])), wl) for i, wl in
+                         enumerate(ERROR_WHITELIST)], key=lambda x: x[0])
         for count, wl in stats:
             dbg("whitelist entry stats: %d: %r", count, wl)
 
-- 
2.18.0.rc1.1.g3f1ff2140

-- 
Eduardo


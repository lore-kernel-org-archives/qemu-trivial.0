Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WN4gj-00064H-B4
	for mharc-qemu-trivial@gnu.org; Mon, 10 Mar 2014 14:12:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44190)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gsomlo@gmail.com>) id 1WN4gc-0005vV-0e
	for qemu-trivial@nongnu.org; Mon, 10 Mar 2014 14:12:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gsomlo@gmail.com>) id 1WN4gW-0001b0-E5
	for qemu-trivial@nongnu.org; Mon, 10 Mar 2014 14:12:25 -0400
Received: from mail-qa0-x22f.google.com ([2607:f8b0:400d:c00::22f]:41185)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gsomlo@gmail.com>)
	id 1WN4gJ-0001Ze-Px; Mon, 10 Mar 2014 14:12:07 -0400
Received: by mail-qa0-f47.google.com with SMTP id w5so7349676qac.34
	for <multiple recipients>; Mon, 10 Mar 2014 11:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=e/b6fysj5uMUolBovSXjaZxUT74NJ1zTjUM3srsruzU=;
	b=HQYU4j1zqlpGPRPZH99pvRBgbnhwVGVQliB4kUEianCMENZrPw8HppjA3+5k5lZW5+
	hXK/NLmrYcXLjGgkoiJaHu7+clKs7I223Gdv48uToyysWvt1UJOT9L3MR47bCz016KM8
	WPHrHEPATa/ydtrGPksxOk+UgKwuIIQKll3cQUWKXL7ObPISAa06Rrw4osAh23vcgGla
	frk/yW4EEmXLsTPp3Y+Qit7Uoi0h0Y3/QIzhc4pnj++S5jijp+l5z2VNS96ZFKi8Xypf
	xRIVIdtYhSvcQosN9C5klBzuCXlRJkjX9woH4C34rC8ucKc4wGvdZ185lpffLqxNofzi
	VW6Q==
X-Received: by 10.224.60.134 with SMTP id p6mr3905153qah.98.1394475127303;
	Mon, 10 Mar 2014 11:12:07 -0700 (PDT)
Received: from ERROL.INI.CMU.EDU (ERROL.INI.CMU.EDU. [128.2.16.43])
	by mx.google.com with ESMTPSA id
	b14sm27539819qga.16.2014.03.10.11.12.06 for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 10 Mar 2014 11:12:07 -0700 (PDT)
Date: Mon, 10 Mar 2014 14:08:59 -0400
From: "Gabriel L. Somlo" <gsomlo@gmail.com>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20140310180859.GT17184@ERROL.INI.CMU.EDU>
References: <20140310171456.GS17184@ERROL.INI.CMU.EDU>
	<531DFCFE.2000006@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <531DFCFE.2000006@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c00::22f
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH v2] Add qga/qapi-generated to .gitignore
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
X-List-Received-Date: Mon, 10 Mar 2014 18:12:31 -0000

The folder "qga/qapi-generated" shows up after building QEMU, and
gets in the way during e.g. "git add ."; Add it to .gitignore to
keep it from accidentally ending up in the wrong place.

Signed-off-by: Gabriel Somlo <somlo@cmu.edu>
---

On Mon, Mar 10, 2014 at 11:57:18AM -0600, Eric Blake wrote:
> Why didn't you anchor it?
> /qga/qapi-generated

Because I'm a n00b to the "process" :)
Thanks for the clue,
  Gabriel

 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index ef7019f..a0895c9 100644
--- a/.gitignore
+++ b/.gitignore
@@ -21,6 +21,7 @@
 libdis*
 libuser
 /linux-headers/asm
+/qga/qapi-generated
 /qapi-generated
 /qapi-types.[ch]
 /qapi-visit.[ch]
-- 
1.8.1.4



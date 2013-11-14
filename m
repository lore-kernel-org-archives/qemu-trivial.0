Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vh0xo-0005cv-AK
	for mharc-qemu-trivial@gnu.org; Thu, 14 Nov 2013 12:44:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41749)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1Vh0xh-0005Sk-4a
	for qemu-trivial@nongnu.org; Thu, 14 Nov 2013 12:44:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1Vh0xb-0002VT-Vu
	for qemu-trivial@nongnu.org; Thu, 14 Nov 2013 12:44:13 -0500
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:36530)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1Vh0xO-0002Sq-1X; Thu, 14 Nov 2013 12:43:54 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	2970D728019E; Thu, 14 Nov 2013 18:43:52 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id sUTEJxXizulH; Thu, 14 Nov 2013 18:43:50 +0100 (CET)
Received: from [192.168.178.35] (p54ADBCA0.dip0.t-ipconnect.de
	[84.173.188.160])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	7194772800DC; Thu, 14 Nov 2013 18:43:49 +0100 (CET)
Message-ID: <52850BD4.7080900@weilnetz.de>
Date: Thu, 14 Nov 2013 18:43:48 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <1377609161-25108-1-git-send-email-sw@weilnetz.de>
	<CAJSP0QVu2gZRu5t9MjO9MHphvJyiRU7W5MCyKZ2q3GWLffxCHw@mail.gmail.com>
In-Reply-To: <CAJSP0QVu2gZRu5t9MjO9MHphvJyiRU7W5MCyKZ2q3GWLffxCHw@mail.gmail.com>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] configure: Don't write .pyc files by
 default (python -B)
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
X-List-Received-Date: Thu, 14 Nov 2013 17:44:18 -0000

Am 14.11.2013 15:45, schrieb Stefan Hajnoczi:
> On Tue, Aug 27, 2013 at 3:12 PM, Stefan Weil <sw@weilnetz.de> wrote:
>> When a Python script is run, Python normally writes bytecode into a .pyc file.
>> QEMU's build process uses several Python scripts which are called from
>> configure or make.
>>
>> The generated .pyc files take disk space without being of much use, because
>> those scripts are short, not time critical and only called a few times.
>>
>> Python's option -B disables writing of .pyc files. QEMU now uses "python -B"
>> as default, but it is still possible to choose a different call by passing
>> --python=PYTHON to configure.
>>
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>> ---
>>
>> It was necessary to change from "$python" to simply $python in the
>> Python test. This should not matter: we already have a simple $python
>> in configure, and Python wants to be installed in a path without
>> spaces.
>>
>> Stefan
[...]
>> This patch breaks ./configure on RHEL 5 and other older distros that
>> use Python 2.4.
>>
>> The version test in ./configure fails because the python interpreter
>> does not accept the -B option:
>> http://buildbot.b1-systems.de/qemu/builders/default_x86_64_rhel5/builds/762/steps/configure/logs/stdio
>>
>> Can you add -B after version detection, if available?  (No .pyc is
>> generated for statements evaluated on the command-line during version
>> detection.)
>>
>> Stefan

I'm sorry that I did not notice this regression in the buildbot report.

We have several possibilities how we can handle this incompatibility for
old versions of Python.

According to http://docs.python.org/2/whatsnew/2.6.html, the -B option
was introduced with
Python 2.6 which was released on October 1 2008.

Solution 1: We don't modify the current configure script because it
works with Python versions
since 5 years. For older versions there is a very simple workaround:
call configure with
--python=python. This additional parameter would also be needed for the
buildbots running
with Python 2.4.

Solution 2: I modify the configure script to set -B only if it is
supported. This makes it marginally
longer (more lines of code, one more Python execution).

Would 1 be sufficient, or do you prefer getting a patch with solution 2?
In any case, I don't think
this is a must for QEMU 1.7.

Stefan



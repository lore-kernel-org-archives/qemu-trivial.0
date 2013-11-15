Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VhFlD-0003Vx-Bc
	for mharc-qemu-trivial@gnu.org; Fri, 15 Nov 2013 04:32:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51591)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1VhFl7-0003OY-4A
	for qemu-trivial@nongnu.org; Fri, 15 Nov 2013 04:32:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1VhFl2-0006dg-Sy
	for qemu-trivial@nongnu.org; Fri, 15 Nov 2013 04:32:13 -0500
Received: from mail-wg0-x236.google.com ([2a00:1450:400c:c00::236]:45265)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1VhFkq-0006c9-Mj; Fri, 15 Nov 2013 04:31:56 -0500
Received: by mail-wg0-f54.google.com with SMTP id y10so3209597wgg.21
	for <multiple recipients>; Fri, 15 Nov 2013 01:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=evBStkmbuI175uWxxV1UU8f50UHCUOnGuz6fdWNavHQ=;
	b=JpBtXjKd90fiOwMGsUUKqtkcMZn0fEyWFS5qFW0rfC7CyKK/stdqy7KeOhiCvgebGl
	DDnFKr9qeAk1VCZRiJk6Hkm6wYs/smfUoclQbWLvauI3DeyRLDeiZtT5EZpH54X87JNT
	MW0EIZfrK/krHuZudhUccMH4I/qjXjKqBXIHs/E5Duwpl3WOKoYY6KnSYDoIBumeol0Z
	BYwo+fjHG6kdkil+sKd468wJzpNhXifB7ywYXQ6xM1W/1qUbQCLQeQQx28pek5yjiR4A
	1wIOvsLgo4dqpnYNCiDXPG93/YOu7EEsvylwSsZ3R3lhT00OITZmiQIjr4gVVTbKdqhW
	vwww==
X-Received: by 10.180.8.98 with SMTP id q2mr6622324wia.26.1384507915372;
	Fri, 15 Nov 2013 01:31:55 -0800 (PST)
Received: from localhost (95-91-233-26-dynip.superkabel.de. [95.91.233.26])
	by mx.google.com with ESMTPSA id ey4sm3188201wic.11.2013.11.15.01.31.53
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Nov 2013 01:31:54 -0800 (PST)
Date: Fri, 15 Nov 2013 10:31:52 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20131115093152.GH12545@stefanha-thinkpad.redhat.com>
References: <1377609161-25108-1-git-send-email-sw@weilnetz.de>
	<CAJSP0QVu2gZRu5t9MjO9MHphvJyiRU7W5MCyKZ2q3GWLffxCHw@mail.gmail.com>
	<52850BD4.7080900@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52850BD4.7080900@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::236
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
X-List-Received-Date: Fri, 15 Nov 2013 09:32:17 -0000

On Thu, Nov 14, 2013 at 06:43:48PM +0100, Stefan Weil wrote:
> Am 14.11.2013 15:45, schrieb Stefan Hajnoczi:
> > On Tue, Aug 27, 2013 at 3:12 PM, Stefan Weil <sw@weilnetz.de> wrote:
> >> When a Python script is run, Python normally writes bytecode into a .pyc file.
> >> QEMU's build process uses several Python scripts which are called from
> >> configure or make.
> >>
> >> The generated .pyc files take disk space without being of much use, because
> >> those scripts are short, not time critical and only called a few times.
> >>
> >> Python's option -B disables writing of .pyc files. QEMU now uses "python -B"
> >> as default, but it is still possible to choose a different call by passing
> >> --python=PYTHON to configure.
> >>
> >> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> >> ---
> >>
> >> It was necessary to change from "$python" to simply $python in the
> >> Python test. This should not matter: we already have a simple $python
> >> in configure, and Python wants to be installed in a path without
> >> spaces.
> >>
> >> Stefan
> [...]
> >> This patch breaks ./configure on RHEL 5 and other older distros that
> >> use Python 2.4.
> >>
> >> The version test in ./configure fails because the python interpreter
> >> does not accept the -B option:
> >> http://buildbot.b1-systems.de/qemu/builders/default_x86_64_rhel5/builds/762/steps/configure/logs/stdio
> >>
> >> Can you add -B after version detection, if available?  (No .pyc is
> >> generated for statements evaluated on the command-line during version
> >> detection.)
> >>
> >> Stefan
> 
> I'm sorry that I did not notice this regression in the buildbot report.
> 
> We have several possibilities how we can handle this incompatibility for
> old versions of Python.
> 
> According to http://docs.python.org/2/whatsnew/2.6.html, the -B option
> was introduced with
> Python 2.6 which was released on October 1 2008.
> 
> Solution 1: We don't modify the current configure script because it
> works with Python versions
> since 5 years. For older versions there is a very simple workaround:
> call configure with
> --python=python. This additional parameter would also be needed for the
> buildbots running
> with Python 2.4.
> 
> Solution 2: I modify the configure script to set -B only if it is
> supported. This makes it marginally
> longer (more lines of code, one more Python execution).
> 
> Would 1 be sufficient, or do you prefer getting a patch with solution 2?
> In any case, I don't think
> this is a must for QEMU 1.7.

Thanks, the patch you sent looks good.

Stefan


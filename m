Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VgyAe-0005aj-C1
	for mharc-qemu-trivial@gnu.org; Thu, 14 Nov 2013 09:45:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57692)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1VgyAa-0005Up-QG
	for qemu-trivial@nongnu.org; Thu, 14 Nov 2013 09:45:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1VgyAZ-00052B-B7
	for qemu-trivial@nongnu.org; Thu, 14 Nov 2013 09:45:20 -0500
Received: from mail-oa0-x234.google.com ([2607:f8b0:4003:c02::234]:63206)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1VgyAU-00051P-OE; Thu, 14 Nov 2013 09:45:14 -0500
Received: by mail-oa0-f52.google.com with SMTP id o6so2284693oag.25
	for <multiple recipients>; Thu, 14 Nov 2013 06:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=tsBKBOy9eM5iY6jOHlqW1O6u3UBCJ0Jq6hGoS3OEvqw=;
	b=DQJW/+8TVxyW+tmQJYBNlCFdj7UiJ28fsWpyPzvWH2G6qFzkPpxdEKVYvGXqaWVH2O
	8YcFhBnYUfLlAUkyrA5hqqrZsEvcFYtNlmCs+Uwg6q7nKTX5xetcTx+yghgnxKllSeJS
	FK1T2gVl+QD36TMszW1b+KAqWwt/0RkZlk+r17jBMTJHtVpCmseOrqNGqrr92VlyDYli
	n8VdDclkHWBgYUX9zaXlrAV0ODRIhA9RtcVCZ1SWG9BxRXFmkaaKbyGw+xhtPUYjQ6FW
	KqdAkQzvUr3PNcgexpQapZ4M3A9cEca1+JPyN+rskq9DDyg583S714WjvR+etNZS/z5d
	S7Ag==
MIME-Version: 1.0
X-Received: by 10.60.144.230 with SMTP id sp6mr1732088oeb.29.1384440313637;
	Thu, 14 Nov 2013 06:45:13 -0800 (PST)
Received: by 10.76.74.135 with HTTP; Thu, 14 Nov 2013 06:45:13 -0800 (PST)
In-Reply-To: <1377609161-25108-1-git-send-email-sw@weilnetz.de>
References: <1377609161-25108-1-git-send-email-sw@weilnetz.de>
Date: Thu, 14 Nov 2013 15:45:13 +0100
Message-ID: <CAJSP0QVu2gZRu5t9MjO9MHphvJyiRU7W5MCyKZ2q3GWLffxCHw@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4003:c02::234
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
X-List-Received-Date: Thu, 14 Nov 2013 14:45:22 -0000

On Tue, Aug 27, 2013 at 3:12 PM, Stefan Weil <sw@weilnetz.de> wrote:
> When a Python script is run, Python normally writes bytecode into a .pyc file.
> QEMU's build process uses several Python scripts which are called from
> configure or make.
>
> The generated .pyc files take disk space without being of much use, because
> those scripts are short, not time critical and only called a few times.
>
> Python's option -B disables writing of .pyc files. QEMU now uses "python -B"
> as default, but it is still possible to choose a different call by passing
> --python=PYTHON to configure.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>
> It was necessary to change from "$python" to simply $python in the
> Python test. This should not matter: we already have a simple $python
> in configure, and Python wants to be installed in a path without
> spaces.
>
> Stefan
>
>  configure |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/configure b/configure
> index 0a55c20..db69327 100755
> --- a/configure
> +++ b/configure
> @@ -568,7 +568,7 @@ fi
>
>  : ${make=${MAKE-make}}
>  : ${install=${INSTALL-install}}
> -: ${python=${PYTHON-python}}
> +: ${python=${PYTHON-python -B}}
>  : ${smbd=${SMBD-/usr/sbin/smbd}}
>
>  # Default objcc to clang if available, otherwise use CC
> @@ -1348,7 +1348,7 @@ fi
>
>  # Note that if the Python conditional here evaluates True we will exit
>  # with status 1 which is a shell 'false' value.
> -if ! "$python" -c 'import sys; sys.exit(sys.version_info < (2,4) or sys.version_info >= (3,))'; then
> +if ! $python -c 'import sys; sys.exit(sys.version_info < (2,4) or sys.version_info >= (3,))'; then
>    error_exit "Cannot use '$python', Python 2.4 or later is required." \
>        "Note that Python 3 or later is not yet supported." \
>        "Use --python=/path/to/python to specify a supported Python."
> --
> 1.7.10.4

This patch breaks ./configure on RHEL 5 and other older distros that
use Python 2.4.

The version test in ./configure fails because the python interpreter
does not accept the -B option:
http://buildbot.b1-systems.de/qemu/builders/default_x86_64_rhel5/builds/762/steps/configure/logs/stdio

Can you add -B after version detection, if available?  (No .pyc is
generated for statements evaluated on the command-line during version
detection.)

Stefan


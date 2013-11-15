Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VhDPr-0003Zj-EF
	for mharc-qemu-trivial@gnu.org; Fri, 15 Nov 2013 02:02:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49606)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VhDPl-0003SF-3j
	for qemu-trivial@nongnu.org; Fri, 15 Nov 2013 02:02:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1VhDPf-0005Am-G7
	for qemu-trivial@nongnu.org; Fri, 15 Nov 2013 02:02:01 -0500
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:45121)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1VhDPS-00055S-84; Fri, 15 Nov 2013 02:01:42 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	432AB728019E; Fri, 15 Nov 2013 08:01:41 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id QqgkS84QqWTG; Fri, 15 Nov 2013 08:01:39 +0100 (CET)
Received: from [192.168.178.35] (p54AD808C.dip0.t-ipconnect.de
	[84.173.128.140])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	93D46728004B; Fri, 15 Nov 2013 08:01:38 +0100 (CET)
Message-ID: <5285C6D1.2080503@weilnetz.de>
Date: Fri, 15 Nov 2013 08:01:37 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Luigi Rizzo <rizzo@iet.unipi.it>, qemu-devel <qemu-devel@nongnu.org>
References: <CA+hQ2+j+Ww4OhHL2tMFdYHaH4FVvtCqYAVCRmbzOBfij=GJVBA@mail.gmail.com>
In-Reply-To: <CA+hQ2+j+Ww4OhHL2tMFdYHaH4FVvtCqYAVCRmbzOBfij=GJVBA@mail.gmail.com>
X-Enigmail-Version: 1.5.2
Content-Type: multipart/alternative;
	boundary="------------010202090808050104000402"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] better interpreter
	specification for scripts
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
X-List-Received-Date: Fri, 15 Nov 2013 07:02:06 -0000

This is a multi-part message in MIME format.
--------------010202090808050104000402
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Am 15.11.2013 07:51, schrieb Luigi Rizzo:
> some of the new scripts in scripts/ specify a interpreter path
> which is not always pointing to the right place.
> I see that an alternative format is also being used
>         #!/usr/bin/env <interpreter_name>
> which seems to work better.
>
> The patch below is merely to let master compile on FreeBSD,
> but there are other offending files that can be found with
>  grep '#!' scripts/*

There is no need to fix acpi_extract.py here, because the error is in
hw/i386/Makefile.objs:

It should call the script using $(PYTHON). Otherwise it won't use the
Python interpreter
which was specified when configure was called with
--python=PYTHON-INTERPRETER.

wrong: hw/i386/Makefile.objs:  $(call quiet-command, $(SRC_PATH)/scripts/...

correct: hw/i386/Makefile.objs:  $(call quiet-command, $(PYTHON)
$(SRC_PATH)/scripts/...

This should be fixed for QEMU 1.7 (send patch with [PATCH for 1.7]).

Stefan

>
> Signed-off-by: Luigi Rizzo <rizzo@iet.unipi.it
> <mailto:rizzo@iet.unipi.it>>
> ---
>  scripts/acpi_extract.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/acpi_extract.py b/scripts/acpi_extract.py
> index 22ea468..66c1b3e 100755
> --- a/scripts/acpi_extract.py
> +++ b/scripts/acpi_extract.py
> @@ -1,4 +1,4 @@
> -#!/usr/bin/python
> +#!/usr/bin/env python
>  # Copyright (C) 2011 Red Hat, Inc., Michael S. Tsirkin
> <mst@redhat.com <mailto:mst@redhat.com>>
>  #
>  # This program is free software; you can redistribute it and/or modify
> --
> 1.8.1.2
>


--------------010202090808050104000402
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">Am 15.11.2013 07:51, schrieb Luigi
      Rizzo:<br>
    </div>
    <blockquote
cite="mid:CA+hQ2+j+Ww4OhHL2tMFdYHaH4FVvtCqYAVCRmbzOBfij=GJVBA@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_default">
          <div class="gmail_default"><font face="courier new, monospace">some
              of the new scripts in scripts/ specify a interpreter path</font></div>
          <div class="gmail_default"><font face="courier new, monospace">which
              is not always pointing to the right place.</font></div>
          <div class="gmail_default"><font face="courier new, monospace">I
              see that an alternative format is also being used</font></div>
          <div class="gmail_default"><font face="courier new, monospace">&nbsp;
              &nbsp; &nbsp; &nbsp; #!/usr/bin/env &lt;interpreter_name&gt;</font></div>
          <div class="gmail_default"><font face="courier new, monospace">which
              seems to work better.</font></div>
          <div class="gmail_default"><font face="courier new, monospace"><br>
            </font></div>
          <div class="gmail_default"><font face="courier new, monospace">The
              patch below is merely to let master compile on FreeBSD,</font></div>
          <div class="gmail_default"><font face="courier new, monospace">but
              there are other offending files that can be found with</font></div>
          <div class="gmail_default"><font face="courier new, monospace">&nbsp;grep
              '#!' scripts/*</font></div>
        </div>
      </div>
    </blockquote>
    <br>
    There is no need to fix acpi_extract.py here, because the error is
    in hw/i386/Makefile.objs:<br>
    <br>
    It should call the script using $(PYTHON). Otherwise it won't use
    the Python interpreter<br>
    which was specified when configure was called with
    --python=PYTHON-INTERPRETER.<br>
    <br>
    wrong: hw/i386/Makefile.objs:&nbsp; $(call quiet-command,
    $(SRC_PATH)/scripts/...<br>
    <br>
    correct: hw/i386/Makefile.objs:&nbsp; $(call quiet-command, $(PYTHON)
    $(SRC_PATH)/scripts/...<br>
    <br>
    This should be fixed for QEMU 1.7 (send patch with [PATCH for 1.7]).<br>
    <br>
    Stefan<br>
    <br>
    <blockquote
cite="mid:CA+hQ2+j+Ww4OhHL2tMFdYHaH4FVvtCqYAVCRmbzOBfij=GJVBA@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_default">
          <div class="gmail_default"><font face="courier new, monospace"><br>
            </font></div>
          <div class="gmail_default"><font face="courier new, monospace">Signed-off-by:
              Luigi Rizzo &lt;<a moz-do-not-send="true"
                href="mailto:rizzo@iet.unipi.it">rizzo@iet.unipi.it</a>&gt;</font></div>
          <div class="gmail_default"><font face="courier new, monospace">---</font></div>
          <div class="gmail_default"><font face="courier new, monospace">&nbsp;scripts/acpi_extract.py
              | 2 +-</font></div>
          <div class="gmail_default"><font face="courier new, monospace">&nbsp;1
              file changed, 1 insertion(+), 1 deletion(-)</font></div>
          <div class="gmail_default"><font face="courier new, monospace"><br>
            </font></div>
          <div class="gmail_default"><font face="courier new, monospace">diff
              --git a/scripts/acpi_extract.py b/scripts/acpi_extract.py</font></div>
          <div class="gmail_default">
            <font face="courier new, monospace">index 22ea468..66c1b3e
              100755</font></div>
          <div class="gmail_default"><font face="courier new, monospace">---
              a/scripts/acpi_extract.py</font></div>
          <div class="gmail_default"><font face="courier new, monospace">+++
              b/scripts/acpi_extract.py</font></div>
          <div class="gmail_default"><font face="courier new, monospace">@@
              -1,4 +1,4 @@</font></div>
          <div class="gmail_default"><font face="courier new, monospace">-#!/usr/bin/python</font></div>
          <div class="gmail_default"><font face="courier new, monospace">+#!/usr/bin/env
              python</font></div>
          <div class="gmail_default"><font face="courier new, monospace">&nbsp;#
              Copyright (C) 2011 Red Hat, Inc., Michael S. Tsirkin &lt;<a
                moz-do-not-send="true" href="mailto:mst@redhat.com">mst@redhat.com</a>&gt;</font></div>
          <div class="gmail_default"><font face="courier new, monospace">&nbsp;#</font></div>
          <div class="gmail_default"><font face="courier new, monospace">&nbsp;#
              This program is free software; you can redistribute it
              and/or modify</font></div>
          <div class="gmail_default"><font face="courier new, monospace">--</font></div>
          <div class="gmail_default"><font face="courier new, monospace">1.8.1.2</font></div>
          <div style="font-family:'courier new',monospace"><br>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------010202090808050104000402--


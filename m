Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WInR8-0005Ad-95
	for mharc-qemu-trivial@gnu.org; Wed, 26 Feb 2014 17:58:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44953)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1WInR1-00051l-G4
	for qemu-trivial@nongnu.org; Wed, 26 Feb 2014 17:58:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1WInQw-0006lk-3F
	for qemu-trivial@nongnu.org; Wed, 26 Feb 2014 17:58:39 -0500
Received: from mail-qg0-x233.google.com ([2607:f8b0:400d:c04::233]:53931)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1WInQl-0006kx-7n; Wed, 26 Feb 2014 17:58:23 -0500
Received: by mail-qg0-f51.google.com with SMTP id q108so3293241qgd.10
	for <multiple recipients>; Wed, 26 Feb 2014 14:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=U3dz+zDLcbjYgH/oqkwF4S8dpW6dzMIbHnqnhc7HF8I=;
	b=KeoZKruqIKnjMCdv1yY1BBrmfuJb96QgztcpTQzQXXGE03zoiMuYV5DJJ58xeIVqLT
	dsO1fbCXEMO29RR8DNYBn/FI9J0wyk4k0TKyCgacEyzi0IJIe6E2xOQQ7QoV6aTGFkZg
	ducclQHy/+5TNHRD5tqS4i+dMmN4cR8ZqRs0AWgV6pcmAmz88SWsBabultDZtj1ehS8G
	p6pjN+HZ2Lab1joEgIlRDNzs6l2iZpiicrcqulYAlbuFHGuR2Ci/tON/HpGMkliFIaeR
	KMaEoo22ig6VzyWRE/MQCtxtanKfQSwk9WeS8WP0JEthR2lZ11zve4vHGow2ENCpHpyw
	Ju/g==
X-Received: by 10.140.23.209 with SMTP id 75mr2776479qgp.89.1393455502535;
	Wed, 26 Feb 2014 14:58:22 -0800 (PST)
Received: from yakj.usersys.redhat.com
	(net-37-117-154-249.cust.vodafonedsl.it. [37.117.154.249])
	by mx.google.com with ESMTPSA id r7sm1981993qgr.17.2014.02.26.14.58.19
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 26 Feb 2014 14:58:21 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <530E7189.7060205@redhat.com>
Date: Wed, 26 Feb 2014 23:58:17 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1393454861-24705-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1393454861-24705-1-git-send-email-peter.maydell@linaro.org>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c04::233
Cc: qemu-trivial@nongnu.org,
	=?ISO-8859-1?Q?Andreas_F=E4rber?= <andreas.faerber@web.de>,
	patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] tests/Makefile: Suppress format-security
 warnings on JSON tests
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
X-List-Received-Date: Wed, 26 Feb 2014 22:58:45 -0000

Il 26/02/2014 23:47, Peter Maydell ha scritto:
> Some of our test binaries programmatically generate JSON format
> strings to feed to qobject_from_json(). Since that function is
> marked with GCC_FMT_ATTR(), clang complains about this:
>  tests/test-qmp-input-visitor.c:76:35: warning: format string is not a
>  string literal (potentially insecure) [-Wformat-security]
>     data->obj = qobject_from_json(json_string);
>                                   ^~~~~~~~~~~

qobject_from_json shouldn't have a GCC_FMT_ATTR marker, only 
qobject_from_jsonf and qobject_from_jsonv.

qobject_from_json passes a NULL va_list*, and then parse_escape in 
qobject/json-parser.c returns NULL before calling va_arg.  Ultimately 
this produces a parse error.

Paolo

> Since these are only test cases and not potential attack vectors,
> the simplest approach is simply to suppress this particular
> compiler warning when compiling the relevant test cases.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I couldn't think of a better way to do this...
>
>  tests/Makefile | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/tests/Makefile b/tests/Makefile
> index b17d41e..496c02f 100644
> --- a/tests/Makefile
> +++ b/tests/Makefile
> @@ -146,6 +146,17 @@ check-qapi-schema-y := $(addprefix tests/qapi-schema/, \
>
>  GENERATED_HEADERS += tests/test-qapi-types.h tests/test-qapi-visit.h tests/test-qmp-commands.h
>
> +# These tests use the qobject_from_json() function with programmatically
> +# generated format strings; since this would otherwise trip clang's
> +# format-security warnings and these are only test binaries, disable
> +# the warnings when building them.
> +JSON_USERS=check-qjson \
> +           check-input-visitor \
> +           test-qmp-input-visitor \
> +           test-visitor-serialization
> +
> +$(JSON_USERS:%=tests/%.o): CFLAGS += -Wno-format-security
> +
>  test-obj-y = tests/check-qint.o tests/check-qstring.o tests/check-qdict.o \
>  	tests/check-qlist.o tests/check-qfloat.o tests/check-qjson.o \
>  	tests/test-coroutine.o tests/test-string-output-visitor.o \
>



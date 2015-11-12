Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZwnSK-0006cD-GD
	for mharc-qemu-trivial@gnu.org; Thu, 12 Nov 2015 03:42:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38767)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZwnSH-0006Vg-4Q
	for qemu-trivial@nongnu.org; Thu, 12 Nov 2015 03:42:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZwnSD-0004D2-45
	for qemu-trivial@nongnu.org; Thu, 12 Nov 2015 03:42:05 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44317)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1ZwnS3-0004Ak-OB; Thu, 12 Nov 2015 03:41:51 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 6909BC0E6E21;
	Thu, 12 Nov 2015 08:41:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tAC8fnu4002804
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 12 Nov 2015 03:41:51 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 451E8303F90B; Thu, 12 Nov 2015 09:41:49 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Rodrigo Rebello <rprebello@gmail.com>
References: <1447275457-1415-1-git-send-email-rprebello@gmail.com>
Date: Thu, 12 Nov 2015 09:41:49 +0100
In-Reply-To: <1447275457-1415-1-git-send-email-rprebello@gmail.com> (Rodrigo
	Rebello's message of "Wed, 11 Nov 2015 18:57:37 -0200")
Message-ID: <8737wbvcc2.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/1] configure: use
	appropriate code fragment for -fstack-protector checks
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
X-List-Received-Date: Thu, 12 Nov 2015 08:42:06 -0000

Rodrigo Rebello <rprebello@gmail.com> writes:

> The check for stack-protector support consisted in compiling and linking
> the test program below (output by function write_c_skeleton()) with the
> compiler flag -fstack-protector-strong first and then with
> -fstack-protector-all if the first one failed to work:
>
>   int main(void) { return 0; }
>
> This caused false positives when using certain toolchains in which the
> compiler accepted -fstack-protector-strong but no support was provided
> by the C library, since for this stack-protector variant the compiler
> emits canary code only for functions that meet specific conditions
> (local arrays, memory references to local variables, etc.) and the code
> fragment under test included none of them (hence no stack protection
> code generated, no link failure).
>
> This fix changes the test program used for -fstack-protector checks to
> include a function that meets conditions which cause the compiler to
> generate canary code in all variants.
>
> Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
> ---
>  configure | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/configure b/configure
> index 46fd8bd..c3d9592 100755
> --- a/configure
> +++ b/configure
> @@ -1486,6 +1486,24 @@ for flag in $gcc_flags; do
>  done
>  
>  if test "$stack_protector" != "no"; then
> +  cat > $TMPC << EOF
> +void foo(const char *c);
> +
> +void foo(const char *c)
> +{
> +    char arr[64], *p;
> +    for (p = arr; *c; c++, p++) {
> +        *p = *c;
> +    }
> +}
> +
> +int main(void)
> +{
> +    char c[] = "";
> +    foo(c);

Why not simply foo("")?

Could the optimizer optimize away the pattern that triggers the canary?

To protect against that possibility, we could use

int main(int argc, char *argv[])
{
    foo(argv[0]);
}

> +    return 0;
> +}
> +EOF
>    gcc_flags="-fstack-protector-strong -fstack-protector-all"
>    sp_on=0
>    for flag in $gcc_flags; do


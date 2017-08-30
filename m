Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dn3Ly-0003cY-AX
	for mharc-qemu-trivial@gnu.org; Wed, 30 Aug 2017 09:48:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59959)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dn3Lu-0003Zo-Vn
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 09:48:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dn3Lr-0002cC-Of
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 09:48:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48778)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1dn3Ll-0002Zz-Jr; Wed, 30 Aug 2017 09:48:09 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8CF51267C5;
	Wed, 30 Aug 2017 13:48:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 8CF51267C5
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=imammedo@redhat.com
Received: from nial.brq.redhat.com (unknown [10.43.2.241])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BE53E8D543;
	Wed, 30 Aug 2017 13:48:05 +0000 (UTC)
Date: Wed, 30 Aug 2017 15:48:03 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-trivial@nongnu.org
Message-ID: <20170830154803.46bc99fc@nial.brq.redhat.com>
In-Reply-To: <1503941985-25657-1-git-send-email-thuth@redhat.com>
References: <1503941985-25657-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 30 Aug 2017 13:48:08 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.11] tests/bios-tables:
 Silence some messages with V=1, print them with V=2 only
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
X-List-Received-Date: Wed, 30 Aug 2017 13:48:20 -0000

On Mon, 28 Aug 2017 19:39:45 +0200
Thomas Huth <thuth@redhat.com> wrote:

> When running "make check-qtest-x86_64 V=1", the output is currently flooded
> with "Looking for expected file ..." and "Using expected file ..." messages.
> None of the other tests is doing that with V=1, so this is a little bit
> annoying. Let's only print these debug messages when we're running the test
> with V=2 or higher.
well, normally make check is run without V=
and if someone once in a while need to run it in verbose mode,
he/she can tolerate it since it's a verbose mode after all.

Hiding message behind V=XX is going to make us remember/recall
at which verbosity level one needs to run tests to get needed
diagnostic info.

I'd rather keep it as it is now.


> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/bios-tables-test.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/bios-tables-test.c b/tests/bios-tables-test.c
> index 564da45..289ee45 100644
> --- a/tests/bios-tables-test.c
> +++ b/tests/bios-tables-test.c
> @@ -40,6 +40,7 @@ typedef struct {
>      int required_struct_types_len;
>  } test_data;
>  
> +static bool really_verbose;
>  static char disk[] = "tests/acpi-test-disk-XXXXXX";
>  static const char *data_dir = "tests/acpi-test-data";
>  #ifdef CONFIG_IASL
> @@ -395,7 +396,7 @@ static GArray *load_expected_aml(test_data *data)
>  try_again:
>          aml_file = g_strdup_printf("%s/%s/%.4s%s", data_dir, data->machine,
>                                     (gchar *)&signature, ext);
> -        if (getenv("V")) {
> +        if (really_verbose) {
>              fprintf(stderr, "\nLooking for expected file '%s'\n", aml_file);
>          }
>          if (g_file_test(aml_file, G_FILE_TEST_EXISTS)) {
> @@ -407,7 +408,7 @@ try_again:
>              goto try_again;
>          }
>          g_assert(exp_sdt.aml_file);
> -        if (getenv("V")) {
> +        if (really_verbose) {
>              fprintf(stderr, "\nUsing expected file '%s'\n", aml_file);
>          }
>          ret = g_file_get_contents(aml_file, &exp_sdt.aml,
> @@ -812,6 +813,11 @@ int main(int argc, char *argv[])
>  {
>      const char *arch = qtest_get_arch();
>      int ret;
> +    const char *v_env = getenv("V");
> +
> +    if (v_env && *v_env >= '2') {
> +        really_verbose = true;
> +    }
>  
>      ret = boot_sector_init(disk);
>      if(ret)



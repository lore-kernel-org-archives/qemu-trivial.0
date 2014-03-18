Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WPyws-00084n-0h
	for mharc-qemu-trivial@gnu.org; Tue, 18 Mar 2014 14:41:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58815)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1WPywl-0007sT-HR
	for qemu-trivial@nongnu.org; Tue, 18 Mar 2014 14:41:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1WPywg-0005mA-Fe
	for qemu-trivial@nongnu.org; Tue, 18 Mar 2014 14:41:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57521)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1WPywW-0005ky-8R; Tue, 18 Mar 2014 14:40:52 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s2IIenH9020080
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 18 Mar 2014 14:40:49 -0400
Received: from blackfin.pond.sub.org (ovpn-116-48.ams2.redhat.com
	[10.36.116.48])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s2IIek3U009515
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 18 Mar 2014 14:40:48 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 50843200D1; Tue, 18 Mar 2014 19:40:46 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1395162223-28733-1-git-send-email-pbonzini@redhat.com>
Date: Tue, 18 Mar 2014 19:40:46 +0100
In-Reply-To: <1395162223-28733-1-git-send-email-pbonzini@redhat.com> (Paolo
	Bonzini's message of "Tue, 18 Mar 2014 18:03:43 +0100")
Message-ID: <874n2vcpu9.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] scripts: add sample model
	file for Coverity Scan
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
X-List-Received-Date: Tue, 18 Mar 2014 18:41:12 -0000

Paolo Bonzini <pbonzini@redhat.com> writes:

> This is the model file that is being used for the QEMU project's scans
> on scan.coverity.com.  It fixed about 30 false positives (10% of the
> total) and exposed about 60 new memory leaks.
>
> The file is not automatically used; changes to it must be propagated
> to the website manually by an admin (right now Markus, Peter and me
> are admins).
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  scripts/coverity-model.c | 170 +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 170 insertions(+)
>  create mode 100644 scripts/coverity-model.c
>
> diff --git a/scripts/coverity-model.c b/scripts/coverity-model.c
> new file mode 100644
> index 0000000..1cc0c1b
> --- /dev/null
> +++ b/scripts/coverity-model.c
> @@ -0,0 +1,170 @@
> +/* Coverity Scan model
> + *
> + * Copyright (C) 2014 Red Hat, Inc.
> + *
> + * Authors:
> + *  Markus Armbruster <armbru@redhat.com>
> + *  Paolo Bonzini <pbonzini@redhat.com>
> + *
> + * This is a modeling file for Coverity Scan. Modeling helps to avoid false
> + * positives.
> + *
> + * - A model file can't import any header files.  Some built-in primitives are
> + *   available but not wchar_t, NULL etc.
> + * - Modeling doesn't need full structs and typedefs. Rudimentary structs
> + *   and similar types are sufficient.
> + * - An uninitialized local variable signifies that the variable could be
> + *   any value.
> + *
> + * The model file must be uploaded by an admin in the analysis settings of
> + * http://scan.coverity.com/projects/378
> + */
> +
> +#define NULL (void *)0
> +#define assert(x) if (!(x)) __coverity_panic__();
> +
> +typedef unsigned char uint8_t;
> +typedef char int8_t;
> +typedef unsigned int uint32_t;
> +typedef int int32_t;
> +typedef long ssize_t;
> +typedef unsigned long long uint64_t;
> +typedef long long int64_t;
> +typedef _Bool bool;
> +
> +/* exec.c */
> +
> +typedef struct AddressSpace AddressSpace;
> +typedef uint64_t hwaddr;
> +
> +static void __write(uint8_t *buf, int len)
> +{
> +    int first, last;
> +    __coverity_negative_sink__(len);
> +    if (len == 0) return;
> +    buf[0] = first;
> +    buf[len-1] = last;
> +    __coverity_writeall__(buf);
> +}
> +
> +static void __read(uint8_t *buf, int len)
> +{
> +    __coverity_negative_sink__(len);
> +    if (len == 0) return;
> +    int first = buf[0];
> +    int last = buf[len-1];
> +}
> +
> +bool address_space_rw(AddressSpace *as, hwaddr addr, uint8_t *buf,
> +                      int len, bool is_write)
> +{
> +    bool result;
> +
> +    // perhaps __coverity_tainted_data_argument__(buf); for read,
> +    // and __coverity_tainted_data_sink__(buf); for write?
> +    if (is_write) __write(buf, len); else __read(buf, len);
> +
> +    return result;
> +}
> +
> +/* Tainting */
> +
> +typedef struct {} name2keysym_t;
> +static int get_keysym(const name2keysym_t *table,
> +                      const char *name)
> +{
> +    int result;
> +    if (result > 0) {
> +        __coverity_tainted_string_sanitize_content__(name);
> +        return result;
> +    } else {
> +        return 0;
> +    }
> +}
> +
> +/* glib */
> +
> +void *malloc (size_t);
> +void *calloc (size_t, size_t);
> +void *realloc (void *, size_t);
> +void free (void *);
> +
> +void *
> +g_malloc (size_t n_bytes)
> +{
> +    void *mem;
> +    __coverity_negative_sink__((ssize_t) n_bytes);
> +    mem = malloc(n_bytes == 0 ? 1 : n_bytes);
> +    if (!mem) __coverity_panic__ ();
> +    return mem;
> +}

This isn't quite honest: g_malloc(0) yields NULL.  Same for the other
allocation functions.

> +
> +void *
> +g_malloc0 (size_t n_bytes)
> +{
> +    void *mem;
> +    __coverity_negative_sink__((ssize_t) n_bytes);
> +    mem = calloc(1, n_bytes == 0 ? 1 : n_bytes);
> +    if (!mem) __coverity_panic__ ();
> +    return mem;
> +}
> +
> +void g_free (void *mem)
> +{
> +    if (mem) {
> +        free(mem);
> +    }
> +}

Unconditional free(mem) should be fine.

> +
> +void *g_realloc (void * mem, size_t n_bytes)
> +{
> +    __coverity_negative_sink__((ssize_t) n_bytes);
> +    if (n_bytes == 0) {
> +        g_free(mem);
> +        return NULL;
> +    } else {
> +        mem = realloc(mem, n_bytes);
> +        if (!mem) __coverity_panic__ ();
> +        return mem;
> +    }
> +}
> +
> +void *g_try_malloc (size_t n_bytes)
> +{
> +    __coverity_negative_sink__((ssize_t) n_bytes);
> +    return malloc(n_bytes == 0 ? 1 : n_bytes);
> +}
> +
> +void *g_try_malloc0 (size_t n_bytes)
> +{
> +    __coverity_negative_sink__((ssize_t) n_bytes);
> +    return calloc(1, n_bytes == 0 ? 1 : n_bytes);
> +}
> +
> +void *g_try_realloc (void *mem, size_t n_bytes)
> +{
> +    __coverity_negative_sink__((ssize_t) n_bytes);
> +    if (n_bytes == 0) {
> +        g_free(mem);
> +        return NULL;
> +    } else {
> +        return realloc(mem, n_bytes);
> +    }
> +}
> +
> +typedef struct _GIOChannel GIOChannel;
> +GIOChannel *g_io_channel_unix_new(int fd)
> +{
> +    GIOChannel *c = g_malloc0(sizeof(GIOChannel));
> +    __coverity_escape__(fd);
> +    return c;
> +}
> +
> +void g_assertion_message_expr(const char     *domain,
> +                              const char     *file,
> +                              int             line,
> +                              const char     *func,
> +                              const char     *expr)
> +{
> +    __coverity_panic__();
> +}

I wonder how much scanning power a derived model for GLib adds.  I'll
find out.


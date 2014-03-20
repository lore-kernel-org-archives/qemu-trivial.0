Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WQc1H-0003j1-7o
	for mharc-qemu-trivial@gnu.org; Thu, 20 Mar 2014 08:24:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41726)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1WQc1A-0003hZ-HM
	for qemu-trivial@nongnu.org; Thu, 20 Mar 2014 08:24:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1WQc15-0004wa-E1
	for qemu-trivial@nongnu.org; Thu, 20 Mar 2014 08:24:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:61376)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1WQc15-0004wP-5p; Thu, 20 Mar 2014 08:24:11 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s2KBNoPq019920
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 20 Mar 2014 07:29:25 -0400
Received: from blackfin.pond.sub.org (ovpn-116-35.ams2.redhat.com
	[10.36.116.35])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s2K8Qu5A013363
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 20 Mar 2014 04:26:58 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 5AB57200D1; Thu, 20 Mar 2014 09:26:56 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1395247965-13889-1-git-send-email-pbonzini@redhat.com>
Date: Thu, 20 Mar 2014 09:26:56 +0100
In-Reply-To: <1395247965-13889-1-git-send-email-pbonzini@redhat.com> (Paolo
	Bonzini's message of "Wed, 19 Mar 2014 17:52:45 +0100")
Message-ID: <87r45xe0mn.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] scripts: add sample
	model file for Coverity Scan
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
X-List-Received-Date: Thu, 20 Mar 2014 12:24:21 -0000

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
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  scripts/coverity-model.c | 178 +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 178 insertions(+)
>  create mode 100644 scripts/coverity-model.c
>
> diff --git a/scripts/coverity-model.c b/scripts/coverity-model.c
> new file mode 100644
> index 0000000..6a1dd6d
> --- /dev/null
> +++ b/scripts/coverity-model.c
> @@ -0,0 +1,178 @@
> +/* Coverity Scan model
> + *
> + * Copyright (C) 2014 Red Hat, Inc.
> + *
> + * Authors:
> + *  Markus Armbruster <armbru@redhat.com>
> + *  Paolo Bonzini <pbonzini@redhat.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or, at your
> + * option, any later version.  See the COPYING file in the top-level directory.
> + */
> +
> +
> +/*
> + * This is a modeling file for Coverity Scan. Modeling helps to avoid false
> + * positives and in some cases helps Coverity in reporting more defects,
> + * especially memory leaks.

Suggest:

/*
 * This is the source code for our Coverity user model file.  The
 * purpose of user models is to increase scanning accuracy by explaining
 * code Coverity can't see (out of tree libraries) or doesn't
 * sufficiently understand.  Better accuracy means both fewer false
 * positives and more true defects.  Memory leaks in particular.
 */

This should make it clear that user models is only about functions that
cause scanning trouble.

Could perhaps be put into the commit message, too.

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

See Eric's comments, and my reply.

> +
> +typedef unsigned char uint8_t;
> +typedef char int8_t;
> +typedef unsigned int uint32_t;
> +typedef int int32_t;
> +typedef long ssize_t;
> +typedef unsigned long long uint64_t;
> +typedef long long int64_t;

These typedefs break when scanning on an oddball system.  Let's not
worry about that now.

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

Suggest to mark things you'd like to try with TODO for easy recogniztion
by humans and grep.

> +    if (is_write) __write(buf, len); else __read(buf, len);
> +
> +    return result;
> +}

I'm curious: could you give me a rough idea on how modelling
address_space_rw() affects results?

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

Curious again: is this just insurance, or did you observe scanning
improvements?

> +
> +/* glib memory allocation functions.
> + *
> + * Note that we ignore the fact that g_malloc of 0 bytes returns NULL,
> + * and g_realloc of 0 bytes frees the pointer.
> + *
> + * Modeling this would result in Coverity flagging a lot of memory
> + * allocations as potentially returning NULL, and asking us to check
> + * whether the result of the allocation is NULL or not.  However, the
> + * resulting pointer would really never be dereferenced anyway.

Suggest to add "in the vast majority of cases".  It *is* possible that
we suppress a defect report for an actual (and invalid!) null pointer
dereference here, we just believe it's too unlikely to be worth wading
through the false positives.

> + */
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

Judging from Coverity's builtin model for malloc(), the cast is
superfluous.  Please drop it.

> +    mem = malloc(n_bytes == 0 ? 1 : n_bytes);
> +    if (!mem) __coverity_panic__ ();
> +    return mem;
> +}

This claims g_malloc(0) returns a non-null pointer to a block of size 1.
Could we say it returns a non-null pointer to a block of size 0?

    int success;

    __coverity_negative_sink__(size);

    if (success) {
        void* tmp = __coverity_alloc__(size);
        if (tmp) __coverity_mark_as_uninitialized_buffer__(tmp);
        __coverity_mark_as_afm_allocated__(tmp, AFM_free);
        return tmp;
    } else {
        __coverity_panic__ ();
    }

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

Let's drop the silly conditional.

> +
> +void *g_realloc (void * mem, size_t n_bytes)
> +{
> +    __coverity_negative_sink__((ssize_t) n_bytes);
> +    mem = realloc(mem, n_bytes == 0 ? 1 : n_bytes);
> +    if (!mem) __coverity_panic__ ();
> +    return mem;
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
> +    return realloc(mem, n_bytes == 0 ? 1 : n_bytes);
> +}
> +
> +/* Other glib functions */
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


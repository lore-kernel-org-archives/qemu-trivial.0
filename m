Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZJoa1-0001RJ-Rv
	for mharc-qemu-trivial@gnu.org; Mon, 27 Jul 2015 16:00:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59691)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZJoZw-0001EW-7s
	for qemu-trivial@nongnu.org; Mon, 27 Jul 2015 16:00:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZJoZu-0005fV-QF
	for qemu-trivial@nongnu.org; Mon, 27 Jul 2015 16:00:52 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46939)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZJoZj-0005VI-8O; Mon, 27 Jul 2015 16:00:39 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id CE194425AF;
	Mon, 27 Jul 2015 23:00:37 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 04CB6A67;
	Mon, 27 Jul 2015 22:54:21 +0300 (MSK)
Received: (nullmailer pid 9523 invoked by uid 1000);
	Mon, 27 Jul 2015 19:54:20 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 27 Jul 2015 22:54:07 +0300
Message-Id: <ab6036630865eff8bb12dd51dfa6921b4607fc81.1438026619.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1438026619.git.mjt@msgid.tls.msk.ru>
References: <cover.1438026619.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 04/10] qemu-common.h: Document cutils.c string
	functions
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
X-List-Received-Date: Mon, 27 Jul 2015 20:00:53 -0000

From: Peter Maydell <peter.maydell@linaro.org>

Add documentation comments for various utility string functions
which we have implemented in util/cutils.c:
 pstrcpy()
 strpadcpy()
 pstrcat()
 strstart()
 stristart()
 qemu_strnlen()
 qemu_strsep()

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/qemu-common.h | 114 +++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 113 insertions(+), 1 deletion(-)

diff --git a/include/qemu-common.h b/include/qemu-common.h
index 237d654..fb3da6c 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -148,13 +148,125 @@ static inline bool is_help_option(const char *s)
     return !strcmp(s, "?") || !strcmp(s, "help");
 }
 
-/* cutils.c */
+/* util/cutils.c */
+/**
+ * pstrcpy:
+ * @buf: buffer to copy string into
+ * @buf_size: size of @buf in bytes
+ * @str: string to copy
+ *
+ * Copy @str into @buf, including the trailing NUL, but do not
+ * write more than @buf_size bytes. The resulting buffer is
+ * always NUL terminated (even if the source string was too long).
+ * If @buf_size is zero or negative then no bytes are copied.
+ *
+ * This function is similar to strncpy(), but avoids two of that
+ * function's problems:
+ *  * if @str fits in the buffer, pstrcpy() does not zero-fill the
+ *    remaining space at the end of @buf
+ *  * if @str is too long, pstrcpy() will copy the first @buf_size-1
+ *    bytes and then add a NUL
+ */
 void pstrcpy(char *buf, int buf_size, const char *str);
+/**
+ * strpadcpy:
+ * @buf: buffer to copy string into
+ * @buf_size: size of @buf in bytes
+ * @str: string to copy
+ * @pad: character to pad the remainder of @buf with
+ *
+ * Copy @str into @buf (but *not* its trailing NUL!), and then pad the
+ * rest of the buffer with the @pad character. If @str is too large
+ * for the buffer then it is truncated, so that @buf contains the
+ * first @buf_size characters of @str, with no terminator.
+ */
 void strpadcpy(char *buf, int buf_size, const char *str, char pad);
+/**
+ * pstrcat:
+ * @buf: buffer containing existing string
+ * @buf_size: size of @buf in bytes
+ * @s: string to concatenate to @buf
+ *
+ * Append a copy of @s to the string already in @buf, but do not
+ * allow the buffer to overflow. If the existing contents of @buf
+ * plus @str would total more than @buf_size bytes, then write
+ * as much of @str as will fit followed by a NUL terminator.
+ *
+ * @buf must already contain a NUL-terminated string, or the
+ * behaviour is undefined.
+ *
+ * Returns: @buf.
+ */
 char *pstrcat(char *buf, int buf_size, const char *s);
+/**
+ * strstart:
+ * @str: string to test
+ * @val: prefix string to look for
+ * @ptr: NULL, or pointer to be written to indicate start of
+ *       the remainder of the string
+ *
+ * Test whether @str starts with the prefix @val.
+ * If it does (including the degenerate case where @str and @val
+ * are equal) then return true. If @ptr is not NULL then a
+ * pointer to the first character following the prefix is written
+ * to it. If @val is not a prefix of @str then return false (and
+ * @ptr is not written to).
+ *
+ * Returns: true if @str starts with prefix @val, false otherwise.
+ */
 int strstart(const char *str, const char *val, const char **ptr);
+/**
+ * stristart:
+ * @str: string to test
+ * @val: prefix string to look for
+ * @ptr: NULL, or pointer to be written to indicate start of
+ *       the remainder of the string
+ *
+ * Test whether @str starts with the case-insensitive prefix @val.
+ * This function behaves identically to strstart(), except that the
+ * comparison is made after calling qemu_toupper() on each pair of
+ * characters.
+ *
+ * Returns: true if @str starts with case-insensitive prefix @val,
+ *          false otherwise.
+ */
 int stristart(const char *str, const char *val, const char **ptr);
+/**
+ * qemu_strnlen:
+ * @s: string
+ * @max_len: maximum number of bytes in @s to scan
+ *
+ * Return the length of the string @s, like strlen(), but do not
+ * examine more than @max_len bytes of the memory pointed to by @s.
+ * If no NUL terminator is found within @max_len bytes, then return
+ * @max_len instead.
+ *
+ * This function has the same behaviour as the POSIX strnlen()
+ * function.
+ *
+ * Returns: length of @s in bytes, or @max_len, whichever is smaller.
+ */
 int qemu_strnlen(const char *s, int max_len);
+/**
+ * qemu_strsep:
+ * @input: pointer to string to parse
+ * @delim: string containing delimiter characters to search for
+ *
+ * Locate the first occurrence of any character in @delim within
+ * the string referenced by @input, and replace it with a NUL.
+ * The location of the next character after the delimiter character
+ * is stored into @input.
+ * If the end of the string was reached without finding a delimiter
+ * character, then NULL is stored into @input.
+ * If @input points to a NULL pointer on entry, return NULL.
+ * The return value is always the original value of *@input (and
+ * so now points to a NUL-terminated string corresponding to the
+ * part of the input up to the first delimiter).
+ *
+ * This function has the same behaviour as the BSD strsep() function.
+ *
+ * Returns: the pointer originally in @input.
+ */
 char *qemu_strsep(char **input, const char *delim);
 time_t mktimegm(struct tm *tm);
 int qemu_fls(int i);
-- 
2.1.4



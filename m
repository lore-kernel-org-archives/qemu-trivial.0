Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bkte1-0003p0-T3
	for mharc-qemu-trivial@gnu.org; Fri, 16 Sep 2016 09:57:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58725)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bktdt-0003hv-UJ
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 09:57:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bktdm-0007Di-Id
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 09:57:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44174)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1bktdJ-0006i5-5z; Fri, 16 Sep 2016 09:57:05 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A7FDBC05AA70;
	Fri, 16 Sep 2016 13:56:34 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-33.ams2.redhat.com [10.36.112.33])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8GDuHk9024127; Fri, 16 Sep 2016 09:56:33 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>
Date: Fri, 16 Sep 2016 15:55:58 +0200
Message-Id: <1474034177-17663-8-git-send-email-lvivier@redhat.com>
In-Reply-To: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
References: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 16 Sep 2016 13:56:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 07/26] tests: use exit(EXIT_SUCCESS) and
 exit(EXIT_FAILURE)
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
X-List-Received-Date: Fri, 16 Sep 2016 13:57:32 -0000

This patch is the result of coccinelle script
scripts/coccinelle/exit.cocci

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 tests/ipmi-bt-test.c      |  6 +++---
 tests/libqtest.c          |  8 ++++----
 tests/migration/stress.c  |  4 ++--
 tests/qht-bench.c         |  2 +-
 tests/rcutorture.c        |  4 ++--
 tests/tcg/hello-i386.c    |  2 +-
 tests/tcg/linux-test.c    |  4 ++--
 tests/tcg/runcom.c        | 12 ++++++------
 tests/tcg/test_path.c     |  2 +-
 tests/test-aio.c          |  2 +-
 tests/test-iov.c          |  8 ++++----
 tests/test-thread-pool.c  |  2 +-
 tests/vhost-user-bridge.c | 18 +++++++++---------
 13 files changed, 37 insertions(+), 37 deletions(-)

diff --git a/tests/ipmi-bt-test.c b/tests/ipmi-bt-test.c
index be9005e..269f276 100644
--- a/tests/ipmi-bt-test.c
+++ b/tests/ipmi-bt-test.c
@@ -383,16 +383,16 @@ static void open_socket(void)
     emu_lfd = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
     if (emu_lfd == -1) {
         perror("socket");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     if (bind(emu_lfd, (struct sockaddr *) &myaddr, sizeof(myaddr)) == -1) {
         perror("bind");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     addrlen = sizeof(myaddr);
     if (getsockname(emu_lfd, (struct sockaddr *) &myaddr , &addrlen) == -1) {
         perror("getsockname");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     emu_port = ntohs(myaddr.sin_port);
     assert(listen(emu_lfd, 1) != -1);
diff --git a/tests/libqtest.c b/tests/libqtest.c
index 42ccb62..92e019f 100644
--- a/tests/libqtest.c
+++ b/tests/libqtest.c
@@ -182,7 +182,7 @@ QTestState *qtest_init(const char *extra_args)
                                   qmp_socket_path,
                                   extra_args ?: "");
         execlp("/bin/sh", "sh", "-c", command, NULL);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     s->fd = socket_accept(sock);
@@ -284,7 +284,7 @@ static GString *qtest_recv_line(QTestState *s)
 
         if (len == -1 || len == 0) {
             fprintf(stderr, "Broken pipe\n");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
 
         g_string_append_len(s->rx, buffer, len);
@@ -355,7 +355,7 @@ static void qmp_response(JSONMessageParser *parser, GQueue *tokens)
     obj = json_parser_parse(tokens, NULL);
     if (!obj) {
         fprintf(stderr, "QMP JSON response parsing failed\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     g_assert(qobject_type(obj) == QTYPE_QDICT);
@@ -381,7 +381,7 @@ QDict *qmp_fd_receive(int fd)
 
         if (len == -1 || len == 0) {
             fprintf(stderr, "Broken pipe\n");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
 
         if (log) {
diff --git a/tests/migration/stress.c b/tests/migration/stress.c
index cf8ce8b..95d2e02 100644
--- a/tests/migration/stress.c
+++ b/tests/migration/stress.c
@@ -51,7 +51,7 @@ static __attribute__((noreturn)) void exit_failure(void)
                 argv0, gettid(), strerror(errno));
         abort();
     } else {
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 }
 
@@ -64,7 +64,7 @@ static __attribute__((noreturn)) void exit_success(void)
                 argv0, gettid(), strerror(errno));
         abort();
     } else {
-        exit(0);
+        exit(EXIT_SUCCESS);
     }
 }
 
diff --git a/tests/qht-bench.c b/tests/qht-bench.c
index 76360a0..4bf2aa3 100644
--- a/tests/qht-bench.c
+++ b/tests/qht-bench.c
@@ -432,7 +432,7 @@ static void parse_args(int argc, char *argv[])
             break;
         case 'h':
             usage_complete(argc, argv);
-            exit(0);
+            exit(EXIT_SUCCESS);
         case 'k':
             init_size = atol(optarg);
             break;
diff --git a/tests/rcutorture.c b/tests/rcutorture.c
index 4002ecf..0a992fd 100644
--- a/tests/rcutorture.c
+++ b/tests/rcutorture.c
@@ -179,7 +179,7 @@ static void perftestrun(int nthreads, int duration, int nreaders, int nupdaters)
         (double)n_reads),
            ((duration * 1000*1000*1000.*(double)nupdaters) /
         (double)n_updates));
-    exit(0);
+    exit(EXIT_SUCCESS);
 }
 
 static void perftest(int nreaders, int duration)
@@ -362,7 +362,7 @@ static void stresstest(int nreaders, int duration)
         printf(" %lld", rcu_stress_count[i]);
     }
     printf("\n");
-    exit(0);
+    exit(EXIT_SUCCESS);
 }
 
 /* GTest interface */
diff --git a/tests/tcg/hello-i386.c b/tests/tcg/hello-i386.c
index fa00380..8b74684 100644
--- a/tests/tcg/hello-i386.c
+++ b/tests/tcg/hello-i386.c
@@ -23,5 +23,5 @@ static inline int write(int fd, const char * buf, int len)
 void _start(void)
 {
     write(1, "Hello World\n", 12);
-    exit(0);
+    exit(EXIT_SUCCESS);
 }
diff --git a/tests/tcg/linux-test.c b/tests/tcg/linux-test.c
index 5070d31..c61cc22 100644
--- a/tests/tcg/linux-test.c
+++ b/tests/tcg/linux-test.c
@@ -53,7 +53,7 @@ void error1(const char *filename, int line, const char *fmt, ...)
     vfprintf(stderr, fmt, ap);
     fprintf(stderr, "\n");
     va_end(ap);
-    exit(1);
+    exit(EXIT_FAILURE);
 }
 
 int __chk_error(const char *filename, int line, int ret)
@@ -334,7 +334,7 @@ void test_socket(void)
         client_fd = client_socket();
         send(client_fd, socket_msg, sizeof(socket_msg), 0);
         close(client_fd);
-        exit(0);
+        exit(EXIT_SUCCESS);
     }
     len = sizeof(sockaddr);
     fd = chk_error(accept(server_fd, (struct sockaddr *)&sockaddr, &len));
diff --git a/tests/tcg/runcom.c b/tests/tcg/runcom.c
index d60342b..3483b62 100644
--- a/tests/tcg/runcom.c
+++ b/tests/tcg/runcom.c
@@ -27,7 +27,7 @@ static void usage(void)
     printf("runcom version 0.1 (c) 2003 Fabrice Bellard\n"
            "usage: runcom file.com\n"
            "VM86 Run simple .com DOS executables (linux vm86 test mode)\n");
-    exit(1);
+    exit(EXIT_FAILURE);
 }
 
 static inline void set_bit(uint8_t *a, unsigned int bit)
@@ -83,7 +83,7 @@ int main(int argc, char **argv)
                     MAP_FIXED | MAP_ANON | MAP_PRIVATE, -1, 0);
     if (vm86_mem == MAP_FAILED) {
         perror("mmap");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 #ifdef SIGTEST
     {
@@ -101,12 +101,12 @@ int main(int argc, char **argv)
     fd = open(filename, O_RDONLY);
     if (fd < 0) {
         perror(filename);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     ret = read(fd, vm86_mem + COM_BASE_ADDR, 65536 - 256);
     if (ret < 0) {
         perror("read");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     close(fd);
 
@@ -151,7 +151,7 @@ int main(int argc, char **argv)
                 ah = (r->eax >> 8) & 0xff;
                 switch(ah) {
                 case 0x00: /* exit */
-                    exit(0);
+                    exit(EXIT_SUCCESS);
                 case 0x02: /* write char */
                     {
                         uint8_t c = r->edx;
@@ -186,7 +186,7 @@ int main(int argc, char **argv)
         default:
             fprintf(stderr, "unhandled vm86 return code (0x%x)\n", ret);
             dump_regs(&ctx.regs);
-            exit(1);
+            exit(EXIT_FAILURE);
         }
     }
 }
diff --git a/tests/tcg/test_path.c b/tests/tcg/test_path.c
index 1c29bce..303eb66 100644
--- a/tests/tcg/test_path.c
+++ b/tests/tcg/test_path.c
@@ -20,7 +20,7 @@ void qemu_log(const char *fmt, ...)
     va_start(ap, fmt);
     vfprintf(stderr, fmt, ap);
     va_end(ap);
-    exit(1);
+    exit(EXIT_FAILURE);
 }
 
 #define NO_CHANGE(_path)						\
diff --git a/tests/test-aio.c b/tests/test-aio.c
index 03aa846..3249bc7 100644
--- a/tests/test-aio.c
+++ b/tests/test-aio.c
@@ -834,7 +834,7 @@ int main(int argc, char **argv)
     ctx = aio_context_new(&local_error);
     if (!ctx) {
         error_reportf_err(local_error, "Failed to create AIO Context: ");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     src = aio_get_g_source(ctx);
     g_source_attach(src, NULL);
diff --git a/tests/test-iov.c b/tests/test-iov.c
index a22d71f..9af8f32 100644
--- a/tests/test-iov.c
+++ b/tests/test-iov.c
@@ -172,7 +172,7 @@ static void test_io(void)
 
     if (socketpair(PF_UNIX, SOCK_STREAM, 0, sv) < 0) {
        perror("socketpair");
-       exit(1);
+       exit(EXIT_FAILURE);
     }
 
     FD_ZERO(&fds);
@@ -203,7 +203,7 @@ static void test_io(void)
                        continue;
                    } else {
                        perror("send");
-                       exit(1);
+                       exit(EXIT_FAILURE);
                    }
                } while(k < j);
            }
@@ -211,7 +211,7 @@ static void test_io(void)
        iov_free(iov, niov);
        g_free(buf);
        g_free(siov);
-       exit(0);
+       exit(EXIT_SUCCESS);
 
     } else {
        /* reader & verifier */
@@ -243,7 +243,7 @@ static void test_io(void)
                        continue;
                    } else {
                        perror("recv");
-                       exit(1);
+                       exit(EXIT_FAILURE);
                    }
                } while(k < j);
                test_iov_bytes(iov, niov, i, j - i);
diff --git a/tests/test-thread-pool.c b/tests/test-thread-pool.c
index 8dbf66a..6b992de 100644
--- a/tests/test-thread-pool.c
+++ b/tests/test-thread-pool.c
@@ -231,7 +231,7 @@ int main(int argc, char **argv)
     ctx = aio_context_new(&local_error);
     if (!ctx) {
         error_reportf_err(local_error, "Failed to create AIO Context: ");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     pool = aio_get_thread_pool(ctx);
 
diff --git a/tests/vhost-user-bridge.c b/tests/vhost-user-bridge.c
index 775e031..63c3716 100644
--- a/tests/vhost-user-bridge.c
+++ b/tests/vhost-user-bridge.c
@@ -68,7 +68,7 @@ static void
 vubr_die(const char *s)
 {
     perror(s);
-    exit(1);
+    exit(EXIT_FAILURE);
 }
 
 static int
@@ -389,7 +389,7 @@ vubr_message_read(int conn_fd, VhostUserMsg *vmsg)
     if (rc == 0) {
         vubr_die("recvmsg");
         fprintf(stderr, "Peer disconnected.\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     if (rc < 0) {
         vubr_die("recvmsg");
@@ -413,7 +413,7 @@ vubr_message_read(int conn_fd, VhostUserMsg *vmsg)
                 "Error: too big message request: %d, size: vmsg->size: %u, "
                 "while sizeof(vmsg->payload) = %zu\n",
                 vmsg->request, vmsg->size, sizeof(vmsg->payload));
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     if (vmsg->size) {
@@ -421,7 +421,7 @@ vubr_message_read(int conn_fd, VhostUserMsg *vmsg)
         if (rc == 0) {
             vubr_die("recvmsg");
             fprintf(stderr, "Peer disconnected.\n");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
         if (rc < 0) {
             vubr_die("recvmsg");
@@ -572,7 +572,7 @@ vubr_post_buffer(VubrDev *dev, VubrVirtq *vq, uint8_t *buf, int32_t len)
         if (!(desc[i].flags & VRING_DESC_F_WRITE)) {
             /* FIXME: we should find writable descriptor. */
             fprintf(stderr, "Error: descriptor is not writable. Exiting.\n");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
 
         void *chunk_start = (void *)(uintptr_t)gpa_to_va(dev, desc[i].addr);
@@ -1276,14 +1276,14 @@ vubr_set_host(struct sockaddr_in *saddr, const char *host)
     if (isdigit(host[0])) {
         if (!inet_aton(host, &saddr->sin_addr)) {
             fprintf(stderr, "inet_aton() failed.\n");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
     } else {
         struct hostent *he = gethostbyname(host);
 
         if (!he) {
             fprintf(stderr, "gethostbyname() failed.\n");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
         saddr->sin_addr = *(struct in_addr *)he->h_addr;
     }
@@ -1304,13 +1304,13 @@ vubr_backend_udp_setup(VubrDev *dev,
     lport = strtol(local_port, (char **)&r, 0);
     if (r == local_port) {
         fprintf(stderr, "lport parsing failed.\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     rport = strtol(remote_port, (char **)&r, 0);
     if (r == remote_port) {
         fprintf(stderr, "rport parsing failed.\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     struct sockaddr_in si_local = {
-- 
2.5.5



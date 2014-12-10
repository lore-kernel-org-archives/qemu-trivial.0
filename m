Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XyhnV-0000QX-61
	for mharc-qemu-trivial@gnu.org; Wed, 10 Dec 2014 08:59:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43153)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <M.Stein@gom.com>) id 1Xydzs-0000bA-TX
	for qemu-trivial@nongnu.org; Wed, 10 Dec 2014 04:56:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <M.Stein@gom.com>) id 1Xydzj-0000j9-Co
	for qemu-trivial@nongnu.org; Wed, 10 Dec 2014 04:55:52 -0500
Received: from mail-in.gom.com ([2a00:1030:1006:44::d90d:4f2e]:40558)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <M.Stein@gom.com>) id 1Xydzj-0000iT-2q
	for qemu-trivial@nongnu.org; Wed, 10 Dec 2014 04:55:43 -0500
Received: from coex.gom.com ([217.13.68.110])
	by mail-in.gom.com (8.14.3/8.14.3/GDS-NASE-42) with ESMTP id
	sBA9SM9c028326
	for <qemu-trivial@nongnu.org>; Wed, 10 Dec 2014 10:28:23 +0100
Received: from mailserver.gom.com (mailserver.gom.com [10.1.130.70])
	by coex.gom.com (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBA9SA49006919
	for <qemu-trivial@nongnu.org>; Wed, 10 Dec 2014 10:28:14 +0100
To: qemu-trivial@nongnu.org
MIME-Version: 1.0
X-KeepSent: 5676542F:59C54BE0-C1257DAA:0031C56D;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3 September 15, 2011
Message-ID: <OF5676542F.59C54BE0-ONC1257DAA.0031C56D-C1257DAA.00331C39@gom.com>
From: M.Stein@gom.com
Date: Wed, 10 Dec 2014 10:18:15 +0100
X-MIMETrack: Serialize by Router on mailserver/gom(Release 8.5.3FP3|November
	15, 2012) at 10.12.2014 10:28:22,
	Serialize complete at 10.12.2014 10:28:22
Content-Type: multipart/alternative;
	boundary="=_alternative 00331C37C1257DAA_="
X-Scanned-By: MIMEDefang 2.72 on 217.13.79.46
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1030:1006:44::d90d:4f2e
X-Mailman-Approved-At: Wed, 10 Dec 2014 08:59:20 -0500
Subject: [Qemu-trivial] Problems with -net socket connect on windows
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
X-List-Received-Date: Wed, 10 Dec 2014 09:56:02 -0000

This is a multipart message in MIME format.
--=_alternative 00331C37C1257DAA_=
Content-Type: text/plain; charset="US-ASCII"

Hi,

FYI: I had problems with this, the error message was:

connect: No error
D:\usr_win\bin\qemu.exe: -net socket,vlan=0,connect=127.0.0.1:56789: 
Device 'socket' could not be initialized

I have done it with qemu 0.14 (win7-64/cygwin32/mingw), but the recent 
code seems to be the same. The Solution
I have googled was, that one have to ignore error WSAEISCONN on windows 
too.

For me it works now.

net/socket.c net_socket_connect_init:

    connected = 0;
    for(;;) {
        ret = connect(fd, (struct sockaddr *)&saddr, sizeof(saddr));
        if (ret < 0) {
            err = socket_error();
            if (err == EINTR || err == EWOULDBLOCK) {
            } else if (err == EINPROGRESS) {
                break;
#ifdef _WIN32
            } else if (err == WSAEALREADY || err == WSAEINVAL) {
                break;
*** added this lines ***
            } else if (err == WSAEISCONN) {
                fprintf(stderr,"connect: ignore 'already connected' error 
(on windows)\n");
                break;
*** end added ***
#endif
            } else {
                perror("connect");
                closesocket(fd);
                return -1;
            }
        } else {
            connected = 1;
            break;
        }

Hope, this helps more, than it makes noise.

                                        Regards

                                        Matthias

--=_alternative 00331C37C1257DAA_=
Content-Type: text/html; charset="US-ASCII"

<font size=2 face="sans-serif">Hi,</font>
<br>
<br><font size=2 face="sans-serif">FYI: I had problems with this, the error
message was:</font>
<br>
<br><font size=2 face="sans-serif">connect: No error</font>
<br><font size=2 face="sans-serif">D:\usr_win\bin\qemu.exe: -net socket,vlan=0,connect=127.0.0.1:56789:
Device 'socket' could not be initialized</font>
<br>
<br><font size=2 face="sans-serif">I have done it with qemu 0.14 (win7-64/cygwin32/mingw),
but the recent code seems to be the same. The Solution</font>
<br><font size=2 face="sans-serif">I have googled was, that one have to
ignore error WSAEISCONN on windows too.</font>
<br>
<br><font size=2 face="sans-serif">For me it works now.</font>
<br>
<br><font size=2 face="sans-serif">net/socket.c net_socket_connect_init:</font>
<br>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; connected = 0;</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; for(;;) {</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; ret = connect(fd,
(struct sockaddr *)&amp;saddr, sizeof(saddr));</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; if (ret
&lt; 0) {</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
err = socket_error();</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
if (err == EINTR || err == EWOULDBLOCK) {</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
} else if (err == EINPROGRESS) {</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; break;</font>
<br><font size=2 face="sans-serif">#ifdef _WIN32</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
} else if (err == WSAEALREADY || err == WSAEINVAL) {</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; break;</font>
<br><font size=2 face="sans-serif">*** added this lines ***</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
} else if (err == WSAEISCONN) {</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; fprintf(stderr,&quot;connect: ignore 'already connected'
error (on windows)\n&quot;);</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; break;</font>
<br><font size=2 face="sans-serif">*** end added ***</font>
<br><font size=2 face="sans-serif">#endif</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
} else {</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; perror(&quot;connect&quot;);</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; closesocket(fd);</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; return -1;</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
}</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; } else {</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
connected = 1;</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
break;</font>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; }</font>
<br>
<br><font size=2 face="sans-serif">Hope, this helps more, than it makes
noise.</font>
<br>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Regards</font>
<br>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Matthias</font>
<br>
--=_alternative 00331C37C1257DAA_=--


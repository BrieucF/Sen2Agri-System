#include <stdio.h>

#include "logger.hpp"

void Logger::initialize() { }

void Logger::debug(const QString &str) { debug(str.toLocal8Bit().constData()); }

void Logger::info(const QString &str) { info(str.toLocal8Bit().constData()); }

void Logger::warn(const QString &str) { warn(str.toLocal8Bit().constData()); }

void Logger::error(const QString &str) { error(str.toLocal8Bit().constData()); }

void Logger::fatal(const QString &str) { fatal(str.toLocal8Bit().constData()); }

void Logger::debug(const char *str)
{
    fprintf(stderr, "%s\n", str);
}

void Logger::info(const char *str)
{
    fprintf(stderr, "%s\n", str);
}

void Logger::warn(const char *str)
{
    fprintf(stderr, "%s\n", str);
}

void Logger::error(const char *str)
{
    fprintf(stderr, "%s\n", str);
}

void Logger::fatal(const char *str)
{
    fprintf(stderr, "%s\n", str);
}

void Logger::installMessageHandler() { qInstallMessageHandler(&Logger::messageHandler); }

void Logger::messageHandler(const QtMsgType type,
                            const QMessageLogContext &context,
                            const QString &message)
{
    const auto &msg = qFormatLogMessage(type, context, message);

    switch (type) {
        case QtDebugMsg:
            debug(msg);
            break;
#if QT_VERSION >= QT_VERSION_CHECK(5, 5, 0)
        case QtInfoMsg:
            info(msg);
            break;
#endif
        case QtWarningMsg:
            warn(msg);
            break;
        case QtCriticalMsg:
            error(msg);
            break;
        case QtFatalMsg:
            fatal(msg);
            break;
    }
}
